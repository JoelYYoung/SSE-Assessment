import os
import sys
import subprocess


###############################################################################
#
# SSE Diff
#
###############################################################################


def main(argv):
    diff_dir_path = argv[1]
    diff_dir_content = os.listdir(diff_dir_path)
    diff_name_list = [diff_unit for diff_unit in diff_dir_content if ".sarif" == diff_unit[-6:]]
    for diff_name in diff_name_list:
        diff_name = diff_name[:-6]
        if diff_dir_path[-1] != '/':
            print("=== {:^30}.c ===".format(diff_name))
            subprocess.call(
                "python sse-assessment.py {0}/{1}.db {0}/{1}.ikos.db {0}/{1}.sarif".format(diff_dir_path, diff_name))
        else:
            subprocess.call(
                "python sse-assessment.py {0}{1}.db {0}{1}.ikos.db {0}{1}.sarif".format(diff_dir_path, diff_name))


if __name__ == "__main__":
    assert len(sys.argv) == 2
    main(sys.argv)
