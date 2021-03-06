import os
import glob
import shutil

SOURCE_PATH = "/tmp/aws-c-common"
INCLUDE_DIR = SOURCE_PATH + "/include"


def creat_dir_and_seahorn_header():
    seahorn_header_dir = INCLUDE_DIR + "/seahorn"
    if not os.path.exists(seahorn_header_dir):
        os.mkdir(seahorn_header_dir)
    else:
        print('clear output directory {}'.format(seahorn_header_dir))
        files_to_del = glob.glob(str(seahorn_header_dir + "/*"))
        for f in files_to_del:
            os.remove(f)

    # new_file = open(seahorn_header_dir + "/seahorn.h", 'a')
    # new_file.write("#define assert(X) if(!(X)) __VERIFIER_error () \n")
    # new_file.close()
    shutil.copyfile("../resourses/seahorn.h", seahorn_header_dir + "/seahorn.h")


def get_cfiles_with_assertions():
    cfiles = [os.path.join(dp, f) for dp, dn, filenames in os.walk(SOURCE_PATH)
                       for f in filenames if os.path.splitext(f)[1] == '.c']
    print('number of .c files {} in "{}"'.format(len(cfiles), SOURCE_PATH))
    cfiles_with_assertion = []
    for f in cfiles:
        if contains_assert(f):
            cfiles_with_assertion.append(f)
        #print(f)

    print('number of .c files with assertions {} in "{}"'.format(len(cfiles_with_assertion), SOURCE_PATH))
    return cfiles_with_assertion

def contains_assert(s):
    assert_string = 'assert('
    not_assert_1 = '_assert'
    #not_assert_2 = 'assert_'
    file = open(s, "r", encoding='ISO-8859-1')
    #file = open(s, "r")
    readfile = file.read()
    file.close()
    if assert_string in readfile and not_assert_1 not in readfile:
        return True
    else:
        return False


def insert_include(files):
    for path in files:
        print(path)
        with open(path, "r") as f:
            contents = f.readlines()

        contents.insert(0, "#include <seahorn/seahorn.h> \n")

        with open(path, "w") as f:
            contents = "".join(contents)
            f.write(contents)


if __name__ == '__main__':
    #create "seahhorn" dir
    #create "seahorn.h" file with:: #define assert(X) if(!(X)) __VERIFIER_error ()
    creat_dir_and_seahorn_header()
    #add #include <seahorn/seahorn.h> in all .c files
    print("test")
    insert_include(get_cfiles_with_assertions())
