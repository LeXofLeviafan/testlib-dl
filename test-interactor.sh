#!/bin/sh

IFS=$'\n'  TESTS=( `ls tests/"$1"*.out | sort --version-sort` );  unset IFS
TESTS=( "${TESTS[@]##tests/$1}" )
TESTS=( "${TESTS[@]%%.out}" )

for TEST in "${TESTS[@]}"; do
    echo -e "\t$1#$TEST"
    cp tests/"$1$TEST".in input.txt
    out/"$1" < tests/"$1$TEST".out >/dev/null
    diff --strip-trailing-cr --side-by-side --suppress-common-lines --new-file \
        log.txt tests/"$1$TEST".log
    diff --strip-trailing-cr --side-by-side --suppress-common-lines --new-file \
        result.txt tests/"$1$TEST".res
    rm {input,log,result}.txt
done
