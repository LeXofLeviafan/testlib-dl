#!/bin/sh

IFS=$'\n'  TESTS=( `ls tests/"$1"*.out | sort --version-sort` );  unset IFS
TESTS=( "${TESTS[@]##tests/$1}" )
TESTS=( "${TESTS[@]%%.out}" )

for TEST in "${TESTS[@]}"; do
    echo -e "\t$1#$TEST"
    out/"$1" tests/"$1$TEST".{in,chk,out} 10 2>/dev/null
    [ `tail -c1 '$result$.txt'` ] && echo >> '$result$.txt'		# ensuring empty last line
    diff --strip-trailing-cr --side-by-side --suppress-common-lines --new-file \
        '$result$.txt' tests/"$1$TEST".res
    rm '$result$.txt'
done
