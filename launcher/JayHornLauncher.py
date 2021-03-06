import os
import glob
import subprocess
import pickle
import hashlib

JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_202.jdk/Contents/Home"
JAVA_OPT = []
JAYHORN_PATH="/Users/ilyazlatkin/IdeaProjects/jayhorn/jayhorn/build/libs/jayhorn.jar"
SOURSE_PATH = "/Users/ilyazlatkin/CLionProjects/aws-c-common"
CLASSPATH = "/Users/ilyazlatkin/IdeaProjects/se_class/build/classes"
SEA_PATH = "/Users/ilyazlatkin/CLionProjects/seahorn/build/run/bin/sea"
SEA_OPTIONS = ['--step=large']
OUTPUT_DIR = "../out"
Z3_PATH = "/Users/ilyazlatkin/CLionProjects/seahorn/build/run/bin/z3"
Z3_TIMEOUT = 30
JAYHORN_TIMEOUT = 100



def contains_assert(s):
    assert_string = 'assert'
    file = open(s, "r", encoding='ISO-8859-1')
    #file = open(s, "r")
    readfile = file.read()
    file.close()
    if assert_string in readfile:
        return True
    else:
        return False


def get_javafiles_with_assertions(extension):
    javafiles = [os.path.join(dp, f) for dp, dn, filenames in os.walk(CLASSPATH)
                       for f in filenames if os.path.splitext(f)[1] == extension]
    print('number of {} files {} in "{}"'.format(extension, len(javafiles), CLASSPATH))
    javafiles_with_assertion = []
    # for f in javafiles:
    #     if contains_assert(f):
    #         javafiles_with_assertion.append(f)
    #     #print(f)

    # print('number of {} files with assertions {} in "{}"'.format(extension,
    #     len(javafiles_with_assertion), CLASSPATH))
    return javafiles


def run_jayhorn_smt(files):
    if not os.path.exists(OUTPUT_DIR):
        os.mkdir(OUTPUT_DIR)
    else:
        print('clear output directory {}'.format(OUTPUT_DIR))
        files_to_del = glob.glob(str(OUTPUT_DIR + "/*"))
        for f in files_to_del:
            os.remove(f)

    out = []
    index = 0
    for f in files:
        tmp = []
        tmp.append(f)
        index += 1
        command = [str(JAVA_HOME + "/bin/java")]
        command += JAVA_OPT
        command.append('-jar')
        command.append(JAYHORN_PATH)
        command.append('-j')
        command.append(CLASSPATH)
        command.append('-solution -trace -out tmp')
        print("{:.2f}".format(100 * index / len(files)), "%", " ".join(command))
        # run sea command
        try:
            # responce_0 = subprocess.run(command,
            #                       stdout=subprocess.PIPE,
            #                       stderr=subprocess.PIPE,
            #                         timeout=SEA_TIMEOUT)
            # command = [SEA_PATH]
            # command += SEA_OPTIONS
            # command.append('horn')
            # command.append(bc_file)
            # command.append('-o')
            # command.append(smt2file)
            # print("\t%", " ".join(command))
            responce = subprocess.run(command,
                                  stdout=subprocess.PIPE,
                                  stderr=subprocess.PIPE,
                                  timeout=JAYHORN_TIMEOUT)
            #print(responce.returncode)
            tmp.append(responce.returncode)
            #print(responce.stdout)
            tmp.append(responce.stdout)
            #print(responce.stderr)
            tmp.append(responce.stderr)
            # if os.path.exists(smt2file):
            #     tmp.append("smt2")
            #     tmp.append(smt2file)
            #     number_of_lines = len(open(smt2file).readlines(  ))
            #     tmp.append(number_of_lines)
            #     if number_of_lines > 4:
            #         print(" ".join([Z3_PATH, smt2file]))
            #         try:
            #             z3responce = subprocess.run([Z3_PATH, smt2file],
            #                                 stdout=subprocess.PIPE,
            #                                 stderr=subprocess.PIPE,
            #                                 timeout=Z3_TIMEOUT)
            #         except subprocess.TimeoutExpired:
            #             tmp.append("z3_error")
            #             print("z3 timeout: {} seconds".format(Z3_TIMEOUT))
            #         # print(z3responce.returncode)
            #         tmp.append(z3responce.returncode)
            #         # print(z3responce.stdout)
            #         tmp.append(z3responce.stdout.decode('ascii').strip())
            #         # print(z3responce.stderr)
            #         tmp.append(z3responce.stderr.decode('ascii').strip())

            out.append(tmp)
        except subprocess.TimeoutExpired:
            print("skipped", f)


    # return format: filesname(0), return_code(1), stdout(2), stderr(3),
    # "smt2"(4) - if smt2-files was created, "location of smt2 file and it's name"(5),
    # number_of_lines in smt2 file (6)
    # z3 - error (7) or z3 status {return code(7), stdout(8), stderr(9)}
    pickle.dump(out, open("save_aws.p", "wb"))
    return out

def print_statistics(stat):
    print('number of .c files with assertions {} in "{}"'.format(len(stat),SOURSE_PATH))
    print('SEA_OPTIONS: {}'.format(" ".join(SEA_OPTIONS)))
    # [x for x in range(1, 10) if x % 2]
    smt2 = [i for i in stat if "smt2" in i]
    print('number of .smt2 files created {}'.format(len(smt2)))
    small_smt2 = [i for i in smt2 if i[6] <=4 ]
    print('\t number of small(<= 4 lines) .smt2 files {}'.format(len(small_smt2)))
    medium_smt2 = [i for i in smt2 if i[6] <=200 and i[6] > 4]
    print('\t number of medium(<= 200 lines) .smt2 files {}'.format(len(medium_smt2)))
    print_z3_info(medium_smt2)
    large_smt2 = [i for i in smt2 if i[6] > 200]
    print('\t number of large(> 200 lines) .smt2 files {}'.format(len(large_smt2)))
    print_z3_info(large_smt2)
    errors = [i[3] for i in stat if len(i[3]) > 0 and "smt2" not in i]
    print('number of errors  {}'.format(len(errors)))
    # fatal error: file not found, implicit declaration of function is invalid in C99
    # static_assert, conflicting types
    error_message = ["file not found", "invalid in C99", "static_assert", "conflicting types"]
    for e in error_message:
        error_parser(errors,e)
    o = []
    for i in errors:
        f = False
        for e in error_message:
            if e in str(i):
                f = True
        if not f: o.append(i)
    print('\t number of other errors is {}'.format(len(o)))


def print_z3_info(stat):
    z3_timeout = [i for i in stat if "z3_error" in i]
    print('\t\tnumber of z3 timeout errors  {}'.format(len(z3_timeout)))
    z3_without_errors = [i for i in stat if "z3_error" not in i]
    z3_sat = [i for i in z3_without_errors if i[8]=='sat']
    print('\t\tnumber of sat {}'.format(len(z3_sat)))
    for i in z3_sat:
        print(i)
    z3_unsat = [i for i in z3_without_errors if i[8]=='unsat']
    print('\t\tnumber of unsat {}'.format(len(z3_unsat)))


def error_parser(errors, message):
    fnf = [i for i in errors if message in str(i)]
    print('\t number of errors "{}" is {}'.format(message, len(fnf)))


if __name__ == '__main__':
    files = get_javafiles_with_assertions(".class")
    run_jayhorn_smt(files)
    #out = pickle.load(open("save_aws.p", "rb"))
    #print_statistics(out)
