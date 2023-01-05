# SSE_Report
## Brief
This project contains 3 sub-directories and 3 python scripts, and 2 bash scripts. **Simply run `run_access.sh` script and wait for report file under `./reports/` dir** (it may take a lot of time, depending on the number source files)!

**Sub-directories**
- `./diff_dir/` : Output db files of ikos and sse.
- `./juliet_testcases/` : Some CWE121, CWE122 and CWE126 testcases (source .c files under `src` directory and metadata files under `metadata` directory) from juliet testsuite. They all contain buffer overflow errors.
- `./reports/` : html outputs of `./assess-in-batch.py` script. Each html contains assessment reports of a batch of testcases. The batch size is presently set to 100, and you can modify the batch size and batch num by changing the `batch_num` and `testcase_num_per_batch` variables in `./assess-in-batch.py` script.

**Python Scripts**
- `./utils/assess-single-testcase.py` **(aborted)**: A script that take output dbs and metadata of a single testcase as input, and output the diff result.
- `./utils/assess-single-testcase-by-ln.py`: Basically the same as `./utils/assess-single-testcase.py`, except that this script uses only the line number as the id of each check.
- `./utils/assess-in-batch.py` : Runs `./utils/assess-single-testcase.py` on files under `./diff_dir/` in batch, and output a result{i}.html file.
- `./utils/sse-report.py` : A script that dumps SSE output db file into error display as well as callsite traces.

**Bash Scripts**

- `assess.sh`: specify source dir, dst dir, metadata dir and report dir, and the script will pull from the specified branch of sse and then build it and run.
- `run_assess_default.sh`: this script is basically runs `assess.sh` on a *default configuration*, with `./juliet_testcases/src/` to be the source dir, `./juliet_testcases/metadata/` to be metadata dir and `./diff_dir/` to be the dst dir, `./reports/` to be the report dir.

## Note
Presently, we just assessed 10 batches of testcases, and each batch contains 100 testcases. The output htmls are available in `./results/` dir.


| **Status** id | meaning                      |
|---------------|------------------------------|
| ignore        | not checked                  |
| safe          | checked to be safe           |
| warning       | checked and raise warning    |
| bug           | checked and must be an error |

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

## Trouble Shooting
### python3.7 error
you should install python3.7 first, or is you have installed python3.x, x>=7, then you can modify both `assess.sh` and `assess-in-batch.py` to adapt to your python edition.