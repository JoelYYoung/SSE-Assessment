import os
import sys
import subprocess
from ansi2html import Ansi2HTMLConverter


###############################################################################
#
# SSE Diff
#
# Note: use this script by the following command:
#       python diff.py arg1
#       arg1: the directory containing all ikos, sse and raw metadata results
###############################################################################


def main(argv):
    diff_dir_path = argv[1]
    diff_dir_content = os.listdir(diff_dir_path)
    diff_name_list = [diff_unit for diff_unit in diff_dir_content if ".sarif" == diff_unit[-6:]]

    if diff_dir_path[-1] != '/':
        diff_dir_path += '/'

    result_str = ""
    for i in range(10):
        for diff_name in diff_name_list[i*10:i*10+10]:
            diff_name = diff_name[:-6]
            one_result_str = "\033[1m=== {:^30}.c ===\033[0m".format(diff_name)+"\n"
            one_result_str += subprocess.run("python assess-single-testcase.py {0}{1}.sse.db {0}{1}.ikos.db {0}{1}.sarif".format(diff_dir_path, diff_name), capture_output=True, text=True).stdout
            result_str += (one_result_str+"\n\n\n")

        conv = Ansi2HTMLConverter(dark_bg=False, markup_lines=True)
        html = conv.convert(result_str)
        with open("results/result{}.html".format(i+1), "w") as f:
            f.write(html)
        print("{} th finished".format(i + 1))


if __name__ == "__main__":
    assert len(sys.argv) == 2
    main(sys.argv)
