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

    if diff_dir_path[-1] != '/':
        diff_dir_path += '/'

    if metadata_dir_path[-1] != '/':
        metadata_dir_path += '/'

    if res_dir_path[-1] != '/':
        res_dir_path += '/'

    

    batch_num = 60  # batch num
    starting_batch = 0  # start from ()th batch
    testcase_num_per_batch = 100
    file_num = len(diff_name_list)

    batch_max_num = int(file_num / testcase_num_per_batch)
    if file_num % testcase_num_per_batch:
        batch_max_num += 1


    for i in range(starting_batch, batch_max_num+starting_batch):
        result_str = ""

        start_file_id = i*testcase_num_per_batch
        max_file_id = i*testcase_num_per_batch+testcase_num_per_batch
        if max_file_id > len(diff_name_list):
            max_file_id = len(diff_name_list)
        for diff_name in diff_name_list[start_file_id:max_file_id]:
            diff_name = diff_name[:-7]
            one_result_str = "\033[1m=== {:^30}.c ===\033[0m".format(diff_name)+"\n"
            one_result_str += subprocess.run("python3.7 ./utils/assess-single-testcase-by-ln.py {0}{2}.sse.db {0}{2}.ikos.db {1}{2}.sarif".format(diff_dir_path, metadata_dir_path, diff_name), capture_output=True, text=True, shell=True).stdout
            result_str += (one_result_str+"\n\n\n")

        conv = Ansi2HTMLConverter(dark_bg=False, markup_lines=True)
        html = conv.convert(result_str)
        with open("{0}result{1}.html".format(res_dir_path, i+1), "w") as f:
            f.write(html)
        print("[assess-in-batch] {} th batch finished!".format(i + 1))


if __name__ == "__main__":
    assert len(sys.argv) == 4
    main(sys.argv)