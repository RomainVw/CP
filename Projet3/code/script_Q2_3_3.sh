#!/bin/bash

chaineX=knapsack_instances/A/knapsack-A-

for i in $(seq 1 1 25);
do
    echo "\begin{figure}[!h]\begin{tabular}{|r|r|r|r|r|}\hline" >> LBUB/A/LBUB-A.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineX$i.txt >> LBUB/A/LBUB-A.txt
    echo "\end{tabular}\end{figure}" >> LBUB/A/LBUB-A.txt
done

chaineY=knapsack_instances/B/knapsack-B-

for i in $(seq 1 1 25);
do
    echo "\begin{figure}[!h]\begin{tabular}{|r|r|r|r|r|}\hline" >> LBUB/B/LBUB-B.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineY$i.txt >> LBUB/B/LBUB-B.txt
    echo "\end{tabular}\end{figure}" >> LBUB/B/LBUB-B.txt
done


chaineZ=knapsack_instances/C/knapsack-C-

for i in $(seq 1 1 25);
do
    echo "\begin{figure}[!h]\begin{tabular}{|r|r|r|r|r|}\hline" >> LBUB/C/LBUB-C.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineZ$i.txt >> LBUB/C/LBUB-C.txt
    echo "\end{tabular}\end{figure}" >> LBUB/C/LBUB-C.txt
done
