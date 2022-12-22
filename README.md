# SSE_Report
## Brief
This project contains 3 sub-directories and 3 python scripts.

**Sub-directories**
- `./diff_dir/` : Output db files of ikos and sse as well as metadata .sarif file from NIST
- `./juliet_testcases/` : Some CWE121, CWE122 and CWE126 testcases (source .c files under `src` directory and metadata files under `metadata` directory) from juliet testsuite. They all contain buffer overflow errors.
- `./results/` : html outputs of `./assess-in-batch.py` script. Each html contains assessment reports of a batch of testcases. The batch size is presently set to 100, and you can modify the batch size and batch num by changing the `batch_num` and `testcase_num_per_batch` variables in `./assess-in-batch.py` script.

**Python Scripts**
- `./assess-single-testcase.py` (aborted): A script that take output dbs and metadata of a single testcase as input, and output the diff result.
- `./assess-single-testcase-by-ln.py`: Basically the same as `./assess-single-testcase.py`, except that this script uses only the line number as the id of each check.
- `./assess-in-batch.py` : Runs `./assess-single-testcase.py` on files under `./diff_dir/` in batch, and output a result{i}.html file.

## Note
Presently, we just assessed 10 batches of testcases, and each batch contains 100 testcases. The output htmls are available in `./results/` dir.


| **Status** id | meaning                      |
|---------------|------------------------------|
| -1            | not checked                  |
| 0             | checked to be safe           |
| 1             | checked and raise warning    |
| 2             | checked and must be an error |

| Diagnose result  | meaning                                |
|------------------|----------------------------------------|
| true pos         ||
| false pos        ||
| true neg         ||
| false neg        ||
| not checked flaw | NIST error line but not checked by SSE |

## Dependency
- https://github.com/pycontribs/ansi2html

You should run `pip3 install ansi2html` to install the dependency.
