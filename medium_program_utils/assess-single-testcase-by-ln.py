import sqlite3
import re as re
import sys
import json
import os


###############################################################################
#
# assess-single-testcase-by-ln.py
#
# Note: use this script by executing the following command
#       python assess-single-testcase-by-ln.py arg1 arg2 arg3
#       arg1: sse db filepath
#       arg2: ikos db filepath
#       arg3: sparrow .output filepath
#       arg4: klee output filepath
#
###############################################################################


# open the db file
def open_db_file(db_filepath):
    db = sqlite3.connect(db_filepath) if os.path.exists(db_filepath) else None
    return db


# get file str
def get_file_str(filepath):
    if os.path.exists(filepath):
        with open(filepath) as fl:
            return fl.read()
    else:
        return ""


# input sse output.db and return list of (ln, status) tuple
def get_ln_list_sse(db):
    loc_list = []
    if db is None:
        return loc_list
    else:
        cur = db.cursor()
        res = cur.execute("SELECT location, status FROM checks")
        loc = res.fetchall()

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
    res_all = []
    if db is None:
        return res_all
    else:
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
def get_ln_list_klee(filename):
    flag = True
    counter = 0
    ln_list = []
    # get err information from filename_0 untils filename_n does not exist
    while flag:
        file_content = get_file_str(filename+"_"+str(counter))
        if file_content == "":
            print(filename+"_"+str(counter))
            flag = False
        # regex match the first filename.c and get line
        search_res = re.findall("{}[.]c:(\d*)".format(filename.split('/')[-1][:-8]), file_content)
        if search_res:
            ln_list.append(int(search_res[0]))
        counter += 1

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


def main(argv):
    db_sse = open_db_file(argv[1])
    db_ikos = open_db_file(argv[2])
    output_sparrow = get_file_str(argv[3])

    sse_list = get_ln_list_sse(db_sse)
    sse_merged = merge_as_highest_level(sse_list)

    ikos_list = get_ln_list_ikos(db_ikos)
    ikos_merged = merge_as_highest_level(ikos_list)

    sparrow_list = get_ln_list_sparrow(output_sparrow)

    klee_list = get_ln_list_klee(argv[4])

    if db_sse is not None:
        db_sse.close()

    if db_ikos is not None:
        db_ikos.close()

    keys_union = set(sse_merged.keys()).union(ikos_merged.keys()).union(set(sparrow_list)).union(set(klee_list))
    keys_list = list(keys_union)
    keys_list.sort()

    counter = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    for key in keys_list:
        sse_result = -1 if key not in sse_merged else sse_merged[key]
        counter[sse_result] += 1

        ikos_result = -1 if key not in ikos_merged else ikos_merged[key]
        counter[ikos_result + 4] += 1

        if key in sparrow_list:
            counter[7] += 1  # sparrow error plus one

        if key in klee_list:
            counter[8] += 1  # klee error plus one


    print("---------------------  table  ---------------------")
    print("{:>10}|{:^9}|{:^9}|{:^9}|{:^9}".format("ln", "SSE", "ikos", "sparrow", "klee"))
    print("--------------------- summary ---------------------")

    status_str_map = {0: "safe", 1: "warning", 2: "error"}
    for i in range(3):
        if i != 2:
            print("{:>10}|{:^9}|{:^9}|{:^9}|{:^9}".format(status_str_map[i], counter[i], counter[i + 4], 0, 0))
        else:
            print("{:>10}|{:^9}|{:^9}|{:^9}|{:^9}".format(status_str_map[i], counter[i], counter[i + 4],
                                                                 counter[7], counter[8]))

    print("--------------------- detail -----------------------")

    for key in keys_list:
        sse_result = -1 if key not in sse_merged else sse_merged[key]
        ikos_result = -1 if key not in ikos_merged else ikos_merged[key]
        sparrow_result = 0 if key not in sparrow_list else 2
        klee_result = 0 if key not in klee_list else 2

        print("{:>10}|{:^18}|{:^18}|{:^18}|{:^18}".format(str(key), color_status(sse_result),
                                                                        color_status(ikos_result),
                                                                        color_status(sparrow_result),
                                                                        color_status(klee_result)))


if __name__ == "__main__":
    assert len(sys.argv) == 5
    main(sys.argv)
