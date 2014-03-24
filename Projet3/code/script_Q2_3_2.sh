#!/bin/bash

chaineZ=knapsack_instances/B/knapsack-B-
mkdir 3.2
rm -rf 3.2/*
echo '' > 3.2/UB-A.txt
    echo "\begin{figure}[!h]\begin{tabular}{|c|c|c|c|c|c|c|}     \hline">> 3.2/UB-B.txt
for i in $(seq 1 1 25);
do

    /Applications/Comet/comet -j2 knapsackUB.co -f$chaineZ$i.txt >> 3.2/UB-B.txt

done
    echo "\end{tabular}\end{figure}" >> 3.2/UB-B.txt