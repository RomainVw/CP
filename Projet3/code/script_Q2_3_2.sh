#!/bin/bash

chaineZ=knapsack_instances/A/knapsack-A-
mkdir 3.2
rm -rf 3.2/*
echo '' > 3.2/UB-A.txt
    echo "\begin{figure}[!h]\begin{tabular}{|r|r|r|r|r|r|r|}     \hline">> 3.2/UB-A.txt
for i in $(seq 1 1 25);
do

    /Applications/Comet/comet -j2 knapsackUB.co -f$chaineZ$i.txt >> 3.2/UB-A.txt

done
    echo "\end{tabular}\end{figure}" >> 3.2/UB-A.txt