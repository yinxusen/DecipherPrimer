#!/bin/bash

ary=({a..z} _)

echo "<e>"
echo "(<s> (<e> *e* *e*))"

for i in ${ary[@]}; do
    echo "(<s> ($i *e* $i))"
done

for i in ${ary[@]}; do
    echo "($i (<s> *e* *e*))"
    echo "($i ($i~ *e* *e*))"
done

for i in ${ary[@]}; do
    for j in ${ary[@]}; do
        echo "($i~ ($i.$j *e* $j))"
        echo "($i.$j ($i.$j~ *e* *e*))"
        echo "($i.$j ($j *e* *e*))"
    done
    echo "($i~ (<e> *e* *e*))"
done

for i in ${ary[@]}; do
    for j in ${ary[@]}; do
        for k in ${ary[@]}; do
            echo "($i.$j~ ($j.$k *e* $k))"
        done
        echo "($i.$j~ (<e> *e* *e*))"
    done
done

