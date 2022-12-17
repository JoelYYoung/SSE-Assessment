# SSE_Report
## Brief
This project contains:
- ./diff_dir/ : output db files of ikos and sse as well as metadata .sarif file from NIST
- ./juliet_testcases/ : some CWE121, CWE122 and CWE126 testcases (source .c files under src directory and metadata files under metadata directory from juliet testsuite. They all contain buffer overflow errors.
- ./assess-single-testcase.py : a script that take output dbs and metadata of a single testcase as input and output the diff result
- ./assess-in-batch.py : run ./assess-single-testcase.py on files under ./diff_dir/ in batch and output a result.html file

## Dependency
- https://github.com/pycontribs/ansi2html
