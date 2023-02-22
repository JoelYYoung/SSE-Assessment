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
#       arg1: ikos and sse output db directory
#       arg2: metadata directory
#       arg3: result directory
###############################################################################


def main(argv):
    diff_dir_path = argv[1]
    metadata_dir_path = argv[2]
    res_dir_path = argv[3]

    diff_dir_content = os.listdir(diff_dir_path)
    diff_name_list = [diff_unit for diff_unit in diff_dir_content if ".sse.db" == diff_unit[-7:]]
    diff_name_list.sort()

    if diff_dir_path[-1] != '/':
        diff_dir_path += '/'

    if metadata_dir_path[-1] != '/':
        metadata_dir_path += '/'

    if res_dir_path[-1] != '/':
        res_dir_path += '/'

    file_num = len(diff_name_list)

    present_batch_name = diff_name_list[0][:-10]

    result_str = ""
    for diff_name in diff_name_list:
        diff_name = diff_name[:-7]

        one_result_str = "\033[1m=== {:^30}.c ===\033[0m".format(diff_name) + "\n"
        one_result_str += subprocess.run(
            "python3 ./utils/assess-single-testcase-by-ln.py {0}{2}.sse.db {0}{2}.ikos.db {1}{2}.sarif {0}{2}.output {0}{2}.ptr.err".format(
                diff_dir_path, metadata_dir_path, diff_name), capture_output=True, text=True, shell=True).stdout

        if present_batch_name in diff_name:
            result_str += (one_result_str + "\n\n\n")
        else:
            conv = Ansi2HTMLConverter(dark_bg=False, markup_lines=True)
            html = conv.convert(result_str)
            with open("{0}{1}.html".format(res_dir_path, present_batch_name), "w") as f:
                f.write(html)
            print("[assess-in-batch] {} finished!".format(present_batch_name))
            result_str = ""
            result_str += (one_result_str + "\n\n\n")
            present_batch_name = diff_name[:-3]

    # handle last
    conv = Ansi2HTMLConverter(dark_bg=False, markup_lines=True)
    html = conv.convert(result_str)
    with open("{0}{1}.html".format(res_dir_path, present_batch_name), "w") as f:
        f.write(html)
    print("[assess-in-batch] {} finished!".format(present_batch_name))

if __name__ == "__main__":
    assert len(sys.argv) == 4
    main(sys.argv)
