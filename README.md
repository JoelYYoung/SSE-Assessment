# SSE_Assessment

## What is SVF-SSE?

SVF-SSE (SVF Static Symbolic Execution) is a static program analyzer，which takes LLVM bit code as input，and outputs a report of detected defects. It consists of two modules: SVF Symbolic Execution module and SSE Defect Checker module. Their relations are shown in the picture bellow: 

<div align=center>
<img src="C:\Users\21018\Desktop\SSE-big-picture2.svg" width="100%">
</div>


SVF Symbolic Execution module basically performs *static symbolic execution*，and finally deducts the possible ranges of the variables in the input program; SSE Defect Checker module then makes use of the deducted ranges of viables, and further deducts possible defects in the input program, e.g., *buffer overflow defect*.

## How does SVF-SSE Work?

***Note:*** Details could be found in [this wiki](https://github.com/JoelYYoung/SVF-Z3/wiki/Design-docs).

Take buffer overflow checker as an example. The main idea is that we perform a check at every usage of memory object, i.e., gep instructions and external memory accessing apis (like `memcpy`). The check process of a gep instruction is simple, for example, when checking `getelementptr inbounds [10 x i32], [10 x i32]* %1, i32 0, i32 1 `, we firstly calculate the size of memory object that pointer `%1` points to, and then we will calculate the offset size of the gep instruction. Then we compare the maximum size with the offset size and decide whether this gep instruction is accessing an invalid address.

The estimated value of **offset** is available instantly by accumulating the estimated value of each offset variable, e.g., the offset of this gep instruciton is calculated by formular $0 \times sizeof([10\times i32]) + 1 \times sizeof(i32) = 4$. The estimated value of the size of memory object is obtained by a more complex process.

Since `%1` could come from multiple sources, they are listed as follows:

| LLVM IR                                                      | Explaination             |
| ------------------------------------------------------------ | ------------------------ |
| `call  void foo(%3)`                                         | parameter passing        |
| `%1 = getelementptr inbounds [10 x [10 x i32]], [10 x [10 x i32]]* %i, i32 0, i32 2 ` | multiple offsets by gep  |
| `%1 = load i32*, i32** %3`                                   | pointer type load stores |
| `%1 = bitcast i8* %3 to i32* `                               | type cast                |

In the above situations, SSE have developed an algorithm to track where `%1` comes from, i.e., the offset chain from alloca site to usage site. The algorithm is listed as follows:

```Python
# Psudo code: tracking offset chain while performing symbolic execution
vardefs = {}  # map from ptr to its latest def site

def handleBlock():
    for instruction in block:
        if instruction is address statement:
        	vardefs[instruction left hand side] = instruction
        else if instruction is gep statement:
            vardefs[instruction left hand side] = instruction
        else if instruction is store statement:
            vardefs[instruction left hand side] = vardefs[instruction right hand side]
        else if instruction is load statement:
            vardefs[instruction left hand side] = vardefs[instruction right hand side]
        # ...
```

After the above efforts, sse can use vardefs information to help performing the checks. The check algorithm is listed as follows:

```Python
# Psudo code: checking algorithm
def checkOffsetValid(pointer, offset):
    previous_total_offset = 0
    memory_size = 0
    present_pointer = pointer
    
    # calculating total_offset and memory_size
	while present_pointer in vardefs:
        if vardefs[present_pointer] is gep statement:
            previous_total_offset += gep_offset
        else if vardefs[present_pointer] is address statement:
            memory_size = alloca size
        else:
            present_pointer = vardefs[present_pointer] right hand side
    
    # deciding if access out of bound?
    if total_offset + offset > memory_size:
        # arouse error
    else:
        # safe
```

## What is SSE_Assessment?

SSE_Assessment provides a set of tools for SSE developers and users to visualize SSE bugs and perform manual check easily.



## Overview of SSE_Assessment

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

## Usages of SSE_Assessment

All usages are available in the correspondent `.py` or `.sh` file's comments.

### Note

 The output htmls are available in `./results/` dir.


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