###############################################################################
#
# sse-report.py
#
# Note: use this script by executing the following command
#       python sse-report.py
#       arg1: sse db filepath
#
###############################################################################


import sqlite3
import re as re
import sys
import json


# input SSE output.db and return list of (checkkind, status, location, context, info) tuple
def get_check_context_list(db):
    cur = db.cursor()
    res = cur.execute("SELECT che.checkkind, che.status, che.location, con.callCFGNodeIdStack che.info FROM checks as che INNER JOIN "
                      "contexts as con WHERE che.contextId = con.contextId")
    res_all = res.fetchall()
    return res_all


def main():
    # connect to db

    # display each error
    # display error message
    # display traceback message


if __name__ == "main":
    assert len(sys.argv) == 2
    main(sys.argv)
