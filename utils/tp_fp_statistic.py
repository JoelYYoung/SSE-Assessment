import sqlite3
import re as re
import sys
import json
import os
import subprocess
from ansi2html import Ansi2HTMLConverter
import numpy as np
import pandas as pd

###############################################################################
#
# tp_fp_statistic.py
#
# Note: use this script by the following command:
#       python assess-in-bath.py arg1
#       arg1: ikos and sse output db directory
#       arg2: metadata directory
#       arg3: result directory
###############################################################################


# open the db file
def open_db_file(db_filepath):
    db = sqlite3.connect(db_filepath)
    return db


# get file str
def get_file_str(filepath):
    with open(filepath) as fl:
        return fl.read()


# get klee file str
def get_klee_file_str(dir_path):
    # search under the dir for .ptr
    if os.path.exists(dir_path):
        with open(dir_path) as fl:
            return fl.read()
    else:
        return "no error"


# input sse output.db and return list of (ln, status) tuple
def get_ln_list_sse(db):
    cur = db.cursor()
    try:
        res = cur.execute("SELECT location, status FROM checks")
        loc = res.fetchall()
    except:
        loc = []

    loc_list = []
    for check_loc in loc:
        loc_str = check_loc[0]
        search_res = re.search("ln: (\d*)", loc_str)
        if search_res is not None:
            loc_list.append((int(search_res[1]), check_loc[1]))
        else:
            loc_list.append((-1, check_loc[1]))
    cur.close()
    return loc_list


# input ikos output.db and return list of (ln, status) tuple
def get_ln_list_ikos(db):
    cur = db.cursor()
    res = cur.execute("SELECT s.line, c.status FROM checks as c INNER JOIN "
                      "statements as s WHERE s.id = c.statement_id AND c.status IN(0, 1, 2)")
    res_all = res.fetchall()
    cur.close()
    return res_all


# input sparrow .output file and return list of ln num
def get_ln_list_sparrow(output_str):
    ln_list = []
    search_res = re.findall("[.]c:(\d*)", output_str)
    if search_res:
        for res in search_res:
            ln_list.append(int(res))
    return ln_list


# input klee .output file and return list of ln num
def get_ln_list_klee(output_str, filename):
    ln_list = []
    search_res = re.findall("{}[.]c:(\d*)".format(filename), output_str)
    # regex match the first filename.c and get line
    if search_res:
        ln_list.append(int(search_res[0]))
    return ln_list


def get_ln_metadata(metadic):
    ln_list = []
    for run in metadic['runs']:
        for res in run['results']:
            if res['ruleId'] in ('CWE-121', 'CWE-122', 'CWE-126'):
                for loc in res['locations']:
                    ln_list.append(loc['physicalLocation']['region']['startLine'])
    return ln_list


# Note: if exist 2 tuples for the same location,
# then save the one with higher status level,
# e.g., save error level if both safe and warning level exists!
def merge_as_highest_level(res_list):
    loc_status_map = {}
    for res in res_list:
        loc = res[0]
        if loc in loc_status_map:
            loc_status_map[loc] = max(res[1], loc_status_map[loc])
        else:
            loc_status_map[loc] = res[1]
    return loc_status_map


def color_status(status):
    if status == -1:
        return "\033[34mignore\033[0m"
    elif status == 0:
        return "\033[32msafe\033[0m".format(status)
    elif status == 1:
        return "\033[33mwarning\033[0m".format(status)
    elif status == 2:
        return "\033[31mbug\033[0m".format(status)
    else:
        return "\033[34m{}\033[0m".format(status)


def is_pos_same(sse_result):
    if sse_result == -1:
        return "not checked flaw"
    elif sse_result == 0:
        return "false neg"
    else:
        return "true pos"


def is_neg_same(sse_result):
    if sse_result in (-1, 0):
        return "true neg"
    else:
        return "false pos"


def tp_fp_counter_ikos_sse(analysis_result, ground_truth):
    analysis_positive_set = set([x for x in analysis_result if analysis_result[x] in (1, 2)])
    tp_set = ground_truth & analysis_positive_set
    fp_set = analysis_positive_set - ground_truth
    return len(tp_set), len(fp_set)


def tp_fp_counter_sparrow_klee(analysis_result, ground_truth):
    analysis_positive_set = set(analysis_result)
    tp_set = ground_truth & analysis_positive_set
    fp_set = analysis_positive_set - ground_truth
    return len(tp_set), len(fp_set)


def get_tp_fp_num(sse_db_path, ikos_db_path, sparrow_output_path, klee_output_path, metadata_path):
    # get sse result
    db_sse = open_db_file(sse_db_path)
    sse_list = get_ln_list_sse(db_sse)
    sse_merged = merge_as_highest_level(sse_list)
    db_sse.close()

    # get ikos result
    db_ikos = open_db_file(ikos_db_path)
    ikos_list = get_ln_list_ikos(db_ikos)
    ikos_merged = merge_as_highest_level(ikos_list)
    db_ikos.close()

    # get sparrow result
    output_sparrow = get_file_str(sparrow_output_path)
    sparrow_list = get_ln_list_sparrow(output_sparrow)

    # get klee result
    output_klee = get_klee_file_str(klee_output_path)
    klee_list = get_ln_list_klee(output_klee, klee_output_path.split('/')[-1][:-8])

    # get ground truth
    with open(metadata_path, "r") as f:
        metadic = json.load(f)
    meta_list = get_ln_metadata(metadic)
    meta_list.sort()
    meta_union = set(meta_list)
    meta_num = len(meta_union)

    tp_fp_list = [tp_fp_counter_ikos_sse(sse_merged, meta_union)[0],
                  tp_fp_counter_ikos_sse(sse_merged, meta_union)[1],
                  tp_fp_counter_ikos_sse(ikos_merged, meta_union)[0],
                  tp_fp_counter_ikos_sse(ikos_merged, meta_union)[1],
                  tp_fp_counter_sparrow_klee(sparrow_list, meta_union)[0],
                  tp_fp_counter_sparrow_klee(sparrow_list, meta_union)[1],
                  tp_fp_counter_sparrow_klee(klee_list, meta_union)[0],
                  tp_fp_counter_sparrow_klee(klee_list, meta_union)[1],
                  meta_num]

    return tp_fp_list


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

    batch_dict = {}
    batch_result = np.array([0, 0, 0, 0, 0, 0, 0, 0, 0])
    total_result = np.array([0, 0, 0, 0, 0, 0, 0, 0, 0])
    present_batch_num = 0
    total_num = 0
    for diff_name in diff_name_list:
        diff_name = diff_name[:-7]

        tp_fp_list = get_tp_fp_num(diff_dir_path + diff_name + ".sse.db",
                                   diff_dir_path + diff_name + ".ikos.db",
                                   diff_dir_path + diff_name + ".output",
                                   diff_dir_path + diff_name + ".ptr.err",
                                   metadata_dir_path + diff_name + ".sarif")

        if present_batch_name in diff_name:
            batch_result += np.array(tp_fp_list)
            present_batch_num += 1
        else:
            batch_dict[present_batch_name+" "+str(present_batch_num)] = [str(x) for x in zip(batch_result, batch_result/batch_result[-1])]
            total_result += batch_result
            total_num += present_batch_num
            batch_result = np.array(tp_fp_list)
            present_batch_num = 1
            present_batch_name = diff_name[:-3]

    # handle last
    present_batch_num += 1
    batch_dict[present_batch_name+" "+str(present_batch_num)] = [str(x) for x in zip(batch_result, batch_result/batch_result[-1])]
    total_result += batch_result
    batch_dict["total "+str(total_num)] = [str(x) for x in zip(total_result, total_result/total_result[-1])]

    result_df = pd.DataFrame.from_dict(batch_dict, orient='index',columns=["SSE_TP(num/rate)", "SSE_FP(num/rate)",
                                                                           "IKOS_TP(num/rate)", "IKOS_FP(num/rate)",
                                                                           "Sparrow_TP(num/rate)", "Sparrow_FP(num/rate)",
                                                                           "Klee_TP(num/rate)", "Klee_FP(num/rate)", "ground_truth(num/rate)"])
    result_df.to_excel("statistic.xlsx", engine="openpyxl")

if __name__ == "__main__":
    assert len(sys.argv) == 4
    main(sys.argv)
