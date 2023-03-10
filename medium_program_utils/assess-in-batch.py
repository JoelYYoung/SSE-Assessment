import os
import sys
import subprocess
from ansi2html import Ansi2HTMLConverter


###############################################################################
#
# assess-in-batch.py
#
# Note: use this script by the following command:
#       python assess-in-bath.py arg1
#       arg1: checker's output files (including db,err,and txt files) directory
#       arg2: result directory
###############################################################################


def main(argv):
    diff_dir_path = argv[1]
    res_dir_path = argv[2]

    diff_dir_content = os.listdir(diff_dir_path)
    diff_name_list = [diff_unit for diff_unit in diff_dir_content if ".sse.db" == diff_unit[-7:]]
    diff_name_list.sort()

    if diff_dir_path[-1] != '/':
        diff_dir_path += '/'

    if res_dir_path[-1] != '/':
        res_dir_path += '/'

    file_num = len(diff_name_list)


    result_str = ""
    for diff_name in diff_name_list:
        diff_name = diff_name[:-7]

        one_result_str = "\033[1m============= {:^20} =============\033[0m".format(diff_name) + "\n"
        one_result_str += subprocess.run(
            "python3 ./assess-single-testcase-by-ln.py {0}{1}.sse.db {0}{2}.ikos.db {0}{2}.output {0}{2}.ptr.err".format(
                diff_dir_path, diff_name, diff_name[:-3]), capture_output=True, text=True, shell=True).stdout
        # print("python3 ./assess-single-testcase-by-ln.py {0}{1}.sse.db {0}{1}.ikos.db {0}{1}.output {0}{1}.ptr.err".format(
        #         diff_dir_path, diff_name))
        result_str += (one_result_str + "\n\n\n")

    conv = Ansi2HTMLConverter(dark_bg=False, markup_lines=True)
    html = conv.convert(result_str)
    with open("./coreutils.html", "w") as f:
        f.write(html)

if __name__ == "__main__":
    assert len(sys.argv) == 3
    main(sys.argv)
