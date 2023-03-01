###############################################################################
#
# sse-report.py
#
# Note: use this script by executing the following command
#       python sse-report.py arg1
#       arg1: sse db filepath
#
###############################################################################


import sqlite3
import re as re
import sys
import json


# open the db file
def open_db_file(db_filepath):
    db = sqlite3.connect(db_filepath)
    return db


# input SSE output.db and return list of (checkkind, status, location, context, info) tuple
def get_check_context_list(db):
    cur = db.cursor()
    res = cur.execute(
        "SELECT che.checkkind, che.status, che.location, con.callCFGNodeIdStack, che.info FROM checks as che INNER JOIN "
        "contexts as con WHERE che.contextId = con.contextId")
    res_all = res.fetchall()
    cur.close()
    return res_all


# filename eliminate dir
def eliminate_file_dir(file_path):
    return file_path.split("/")[-1]


def get_context_list(db, context_str):
    cur = db.cursor()
    res_all = []
    context_node_id_stack = json.loads(context_str)
    for node_id in context_node_id_stack:
        res = cur.execute("SELECT content FROM ICFGNodes WHERE nodeId = {}".format(node_id))
        res_all.insert(0, res.fetchall()[0][0])
    cur.close()
    return res_all


def parse_check_context_list_bug(db, check_context_list):
    parsed_check_context_list = []
    for check_context in check_context_list:
        if check_context[1] in (1, 2):

            if check_context[2] != '':
                search_res = re.search("ln: (\d*)[ ]*cl: (\d*)[ ]*fl: (.*) }", check_context[2])
                check_loc = (int(search_res[1]), int(search_res[2]), search_res[3])
            else:
                check_loc = (-1, -1, "/unknown/No_File_Info")

            check_context_list = get_context_list(db, check_context[3])

            check_info = json.loads(check_context[4])

            parsed_check_context_list.append((
                check_context[0],  # checkkind
                check_context[1],  # checkstatus
                check_loc,
                check_context_list,
                check_info
            ))
    return parsed_check_context_list


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


def print_check_context(check_context_list):
    for check_context in check_context_list:
        print("{}:{}:{}: {}: {},\n\tinfo: {}\n".format(
            eliminate_file_dir(check_context[2][2]), check_context[2][0], check_context[2][1],
            color_status(check_context[1]), "buffer overflow", check_context[4]
        ))
        print("{}:{}:{}: \033[34mnote\033[0m: called from:".format(
            eliminate_file_dir(check_context[2][2]),
            check_context[2][0], check_context[2][1]
        ))
        for context in check_context[3]:
            search_res = re.search("fun: (.*){ ln: (\d*)[ ]*cl: (\d*)[ ]*fl: (.*) }", context)
            print("\t==> callsite: {}:{}:{}: function '{}'".format(
                eliminate_file_dir(search_res[4]), search_res[2],
                search_res[3], search_res[1]
            ))
        print("\t---------------------------------------------")


def main(argv):
    # connect to db
    sse_db = open_db_file(argv[1])

    check_context_list = get_check_context_list(sse_db)
    parsed_check_context_list = parse_check_context_list_bug(sse_db, check_context_list)

    print_check_context(parsed_check_context_list)

    # close db
    sse_db.close()


if __name__ == "__main__":
    assert len(sys.argv) == 2
    main(sys.argv)
