# Testlib

## Intro

This project contains C++ implementation of the testlib. It is already being used on many programming contests in Russia (Russian National Olympiad in Informatics, different stages of ACM-ICPC). Join!

The library C++ code is tested for compatibility with Borland C++ (5.6), Microsoft Visual C++ (2003+), g++ (MinGW 4.0.2). Also we don't hear any issues about incorrect work with other compilers.

This code used many times on Open Team Programming Collegiate Cup contests (http://opencup.ru/) running on Linux platform and compiled by g++ compiler.

This particular fork is used to recompile checker/player programs for DL testing format (based on C version of DL_I library). It also includes a checker matching output of players (`dl-player`).

## Testing (Linux)

`make test` to run checker/player tests. `make clean` to remove built checker/player binaries.

## Samples

### Checker

This is sample checker which expects in the output and in the answer the same integer. It ignores all white-spaces. See more examples in the package.

In DL version, additional console output from checker is unnecessary; it can still be enabled (for debug purposes) using `-DBY_HAND`.

```c++
#include "testlib.h"

int main(int argc, char * argv[])
{
    setName("compares two signed integers");
    registerTestlibCmd(argc, argv);
    int ja = ans.readInt();
    int pa = ouf.readInt();
    if (ja != pa)
        quitf(_wa, "expected %d, found %d", ja, pa);
    quitf(_ok, "answer is %d", ja);
}
```

### Interactor

This sample interactor reads pairs of numbers from input file, sends it to the other program, reads
result and writes it to output file (to be verified later). Another option could be terminating
interactor with `quitf(_wa, <comment>)`.

The DL version is supposed to take no arguments, so filenames are compiled in. To provide a filename,
pass a C string literal as a value of `-D` variable: `INFILE` (defaults to `"$player$.in"`),
`OUTFILE` (defaults to `"$player$.out"`), or `LOGFILE` (optional).

```c++
#include "testlib.h"
#include <iostream>

using namespace std;

int main(int argc, char* argv[])
{
    setName("Interactor A+B");
    registerInteraction(argc, argv);

    // reads number of queries from test (input) file
    int n = inf.readInt();
    for (int i = 0; i < n; i++)
    {
        // reads query from test (input) file
        int a = inf.readInt();
        int b = inf.readInt();

        // writes query to the solution, endl makes flush
        cout << a << " " << b << endl;

        // writes output file to be verified by checker later
        tout << ouf.readInt() << endl;
    }

    // just message
    quitf(_ok, "%d queries processed", n);
}
```
