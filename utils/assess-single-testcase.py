import sqlite3
import re as re
import sys
import json


###############################################################################
#
# assess-single-testcase.py
#
# Note: use this script by executing the following command
#       python assess-single-testcase.py arg1 arg2 arg3
#       arg1: sse db filepath
#       arg2: ikos db filepath
#       arg3: raw metadata filepath
#
###############################################################################


# open the db file
def open_db_file(db_filepath):
    db = sqlite3.connect(db_filepath)
    return db


# input sse output.db and return list of (ln, cl, status) tuple
def get_ln_cl_list_sse(db):
    cur = db.cursor()
    res = cur.execute("SELECT location, status FROM checks")
    loc = res.fetchall()

    loc_list = []
    for check_loc in loc:
        loc_str = check_loc[0]
        search_res = re.search("ln: (\d*)[ ]*cl: (\d*)", loc_str)
        if search_res is not None:
            loc_list.append((int(search_res[1]), int(search_res[2]), check_loc[1]))
        else:
            loc_list.append((-1, -1, 0))
    cur.close()
    return loc_list


# input ikos output.db and return list of (ln, cl, status) tuple
def get_ln_cl_list_ikos(db):
    cur = db.cursor()
    res = cur.execute("SELECT s.line, s.column, c.status FROM checks as c INNER JOIN "
                      "statements as s WHERE s.id = c.statement_id AND c.status IN(0, 1, 2)")
    res_all = res.fetchall()
    cur.close()
    return res_all


def get_ln_metadata(metadic):
    ln_list = []
    for run in metadic['runs']:
        for res in run['results']:
            if res['ruleId'] in ('CWE-121', 'CWE-122'):
                for loc in res['locations']:
                    ln_list.append(loc['physicalLocation']['region']['startLine'])
    return ln_list


# Note: if exist 2 tuples for the same location,
# then save the one with higher status level,
# e.g., save error level if both safe and warning level exists!
def merge_as_highest_level(res_list):
    loc_status_map = {}
    for res in res_list:
        loc = (res[0], res[1])
        if loc in loc_status_map:
            loc_status_map[loc] = max(res[2], loc_status_map[loc])
        else:
            loc_status_map[loc] = res[2]
    return loc_status_map


def color_status(status):
    if status == -1:
        return "\033[34m{}\033[0m".format(status)
    elif status == 0:
        return "\033[32m{}\033[0m".format(status)
    elif status == 1:
        return "\033[33m{}\033[0m".format(status)
    elif status == 2:
        return "\033[31m{}\033[0m".format(status)
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
    metadata_path = argv[3]

    sse_list = get_ln_cl_list_sse(db_sse)
    sse_merged = merge_as_highest_level(sse_list)

    ikos_list = get_ln_cl_list_ikos(db_ikos)
    ikos_merged = merge_as_highest_level(ikos_list)

    db_sse.close()
    db_ikos.close()

    with open(metadata_path, "r") as f:
        metadic = json.load(f)
    meta_list = get_ln_metadata(metadic)
    meta_list.sort()
    meta_union = set(meta_list)
    meta_num = len(meta_list)

    keys_union = set(sse_merged.keys()).union(ikos_merged.keys())
    keys_list = list(keys_union)
    keys_list.sort()

    counter = [0, 0, 0, 0, 0, 0, 0, 0]
    for key in keys_list:
        sse_result = -1 if key not in sse_merged else sse_merged[key]
        counter[sse_result] += 1

        ikos_result = -1 if key not in ikos_merged else ikos_merged[key]
        counter[ikos_result + 4] += 1

    if meta_num != counter[5]:
        print("\033[1mresult\033[0m: different!")
    else:
        print("\033[1mresult\033[0m: same!")

    print("-----------------------  table  -----------------------")
    print("{:>10}|{:^5}|{:^5}|{:^15}|{:^15}".format("(ln, cl)", "SSE", "ikos", "artifact", "diagnose"))
    print("----------------------- summary -----------------------")

    status_str_map = {0: "safe", 1: "warning", 2: "error"}
    for i in range(3):
        if i != 2:
            print("{:>10}|{:^5}|{:^5}|       0".format(status_str_map[i], counter[i], counter[i + 4]))
        else:
            print("{:>10}|{:^5}|{:^5}|{:^15}".format(status_str_map[i], counter[i], counter[i + 4], meta_num))

    print("----------------------- detail ------------------------")

    for key in keys_list:
        sse_result = -1 if key not in sse_merged else sse_merged[key]
        ikos_result = -1 if key not in ikos_merged else ikos_merged[key]
        if key[0] in meta_union:
            print("{:>10}|{:^14}|{:^14}|{:^24}|{:^15}".format(str(key), color_status(sse_result), color_status(ikos_result),
                                                          color_status(2), is_pos_same(sse_result)))
            if sse_result in (1, 2):
                meta_union.remove(key[0])
            try:
                meta_list.remove(key[0])
            except:
                pass
        else:
            print("{:>10}|{:^14}|{:^14}|{:^24}|{:^15}".format(str(key), color_status(sse_result), color_status(ikos_result),
                                                       color_status(0), is_neg_same(sse_result)))

    for meta_unit in meta_list:
        print("{:>10}|{:^14}|{:^14}|{:^24}|{:^15}".format(str((meta_unit, '?')), color_status(-1), color_status(-1),
                                                   color_status(2), "not checked flaw"))


if __name__ == "__main__":
    assert len(sys.argv) == 4
    main(sys.argv)
