#!/bin/bash

ary=({a..z})

echo "0"
for i in ${ary[@]}
do
    for j in ${ary[@]}
    do
        echo "(0 (0 $i $j 1))"
    done
done

echo "(0 (0 _ _ 1))"
