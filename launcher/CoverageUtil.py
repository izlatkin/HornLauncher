import os


class CoverageUtil:

    """Return a list if strings

    method receives list of files (list of paths to files)
    method merge coverage files to one coverage file (list of str )
    """

    def merge_coverage_for_test_runs(files):# -> list[str]:
        if len(files) == 1:
            return open(files[0], "r").readlines()
        else:
            path = os.path.abspath(files[0])
            path = os.path.dirname(path)
            covers = [read_coverage_info(f) for f in files]
            covers = [d for d in covers if bool(d)]
            out = []
            for key, value in covers[0].items():
                if 'assert.h' in key:
                    continue
                tmp_list = [value]
                for c in covers[1:]:
                    if key in c:
                        tmp_list.append(c[key])
                    else:
                        return 'merge error'
                sf = 'SF:{}/{}\n'.format(path, key)
                #if not key.endswith('.h'): # ToDo removed when fixed https://github.com/izlatkin/HornLauncher/issues/12
                out += [sf] + CoverageUtil.merge_coverage_lists(tmp_list)
        return ['TN:\n'] + out




    """Return a list if strings

    method merges list of lists (coverage data for one particular file, for example for main.c)
    """

    def merge_coverage_lists(covers):# -> list[str]:
        # if len(files) == 0:
        #     return []
        # covers = [open(f, "r").readlines() for f in files]
        # covers = [f for f in covers if len(f) > 1]
        result_list_of_lines = []
        branch_number = 0
        for index, line in enumerate(covers[0]):
            if 'end_of_record' in line:
                result_list_of_lines.append(line)
            else:
                tmp = line.split(':')
                tag = tmp[0]
                data = tmp[1].strip().split(',')

                if tag == 'BRDA':
                    c = data[-1]
                    if c == '1':
                        branch_number += 1
                        result_list_of_lines.append(line)
                    else:
                        tmp_l = [j[index].strip().split(',')[-1] for j in covers[1:]]
                        sum_coverage = 0
                        for t in tmp_l:
                            if is_int(t):
                                sum_coverage += int(t)
                        if sum_coverage > 0:
                            #result_list_of_lines.append(covers[tmp_l.index('1') + 1][index])
                            result_list_of_lines.append("BRDA:{},{}\n".format(','.join(data[:3]), sum_coverage))
                        else:
                            result_list_of_lines.append(line)
                elif tag == 'BRH':
                    result_list_of_lines.append("BRH:{}\n".format(branch_number))
                elif tag == 'DA':
                    sum_coverage = 0
                    lc = data
                    if is_int(lc[-1]):
                        sum_coverage += int(lc[-1])
                    for j in covers[1:]:
                        if is_int(j[index].split(',')[-1]):
                            sum_coverage += int(j[index].split(',')[-1])
                    nl = 'DA:{},{}\n'.format(lc[0], sum_coverage)
                    result_list_of_lines.append(nl)
                else:
                    result_list_of_lines.append(line)
        return result_list_of_lines

    """ Generate Final Report
    """

    def merge_summary_reports(files):
        if not files:
            return []
        covers = [open(f, "r").readlines() for f in files]
        result_list_of_lines = covers[0]
        for c in covers[1:]:
            result_list_of_lines += c[1:]
        return result_list_of_lines


    def remove_headers_coverage(file):
        lines = open(file, "r").readlines()
        out = []
        remove = False
        for line in lines:
            if os.path.isfile(line[3:].strip('\n')):
                if 'testgen.h' in line:
                    remove = True
                else:
                    remove = False
            if not remove:
                out.append(line)
        return out





""" Return True/False

checks if input value can be converted to int
"""


def is_int(val):
    try:
        int(val)
    except ValueError:
        return False
    return True


def read_coverage_info(f):
    lines = open(f, "r").readlines()
    out = {}
    tmp_file = None
    tmp_content = []
    for line in lines:
        if 'TN:' in line:
            continue
        elif 'end_of_record' in line:
            tmp_content.append(line)
            out[tmp_file] = tmp_content
            tmp_content = []
        else:
            tmp = line.strip('\n').split(':')
            tag = tmp[0]
            data = tmp[1]
            if tag == 'SF': # and os.path.isfile(data):
                if os.path.basename(data) in ['main.c', 'testgen.h']:
                    tmp_file = os.path.basename(data)
                else:
                    tmp_file = data
            else:
                tmp_content.append(line)
    # for key, value in out.items():
    #     print(key, ' : \n')
    #     for v in value:
    #         print('\t:', v.strip('\n'))
    return out



if __name__ == '__main__':
    # result = CoverageUtil.merge(['/tmp/sandbox/testgen_1/1/coverage.info',
    #                     '/tmp/sandbox/testgen_1/2/coverage.info',
    #                     '/tmp/sandbox/testgen_1/3/coverage.info'])
    result = CoverageUtil.merge_coverage_for_test_runs(['../sandbox/test_8/3/coverage.info',
                                                        '../sandbox/test_8/5/coverage.info',
                                                        '../sandbox/test_8/1/coverage.info',
                                                        '../sandbox/test_8/2/coverage.info',
                                                        '../sandbox/test_8/4/coverage.info',
                                                        '../sandbox/test_8/7/coverage.info',
                                                        '../sandbox/test_8/6/coverage.info'])
    # result = CoverageUtil.merge_coverage_for_test_runs(['/Users/ilyazlatkin/Downloads/sandbox2/test_11/1/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/2/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/3/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/4/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/5/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/6/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/7/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/8/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/9/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/10/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/11/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/12/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/13/coverage.info',
    #                                                    '/Users/ilyazlatkin/Downloads/sandbox2/test_11/14/coverage.info',
    #                                                     '/Users/ilyazlatkin/Downloads/sandbox2/test_11/15/coverage.info',
    #                                                     '/Users/ilyazlatkin/Downloads/sandbox2/test_11/16/coverage.info',])
    # for i in result:
    #     print(i, end='')
    # result = CoverageUtil.merge_coverage_for_test_runs(
    #     ['../sandbox/testgen_2/summary/summary_coverage.info', '../sandbox/testgen_2/summary/summary_coverage.info'])
    # for i in result:
    #     print(i)
    # result = read_coverage_info('../sandbox/testgen_2/3/coverage.info')
    # result = read_coverage_info('../sandbox/testgen_2/6/coverage.info')
    # result = read_coverage_info('../sandbox/testgen_2/7/coverage.info')
    summary_file = open('../sandbox/final_coverage_report/final_coverage.info', "w")
    summary_file.writelines(result)
    summary_file.close()
    result = CoverageUtil.remove_headers_coverage('../sandbox/final_coverage_report/final_coverage.info')
    for i in result:
        print(i, end='')

