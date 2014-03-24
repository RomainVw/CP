#!/bin/bash

chaineX=knapsack_instances/A/knapsack-A-
#echo "\\begin{figure}[!h]\\begin{tabular}{|r|r|r|r|r|}\\hline" >> LBUB/A/LBUB-A.txt
for i in $(seq 1 1 25);
do
    echo "A$i&" >> LBUB/A/LBUB-A.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineX$i.txt >> LBUB/A/LBUB-A.txt
done
#echo "\\end{tabular}\\end{figure}" >> LBUB/A/LBUB-A.txt

chaineY=knapsack_instances/B/knapsack-B-

#echo "\\begin{figure}[!h]\\begin{tabular}{|r|r|r|r|r|}\\hline" >> LBUB/B/LBUB-B.txt
for i in $(seq 1 1 25);
do
    echo "B$i&" >> LBUB/B/LBUB-B.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineY$i.txt >> LBUB/B/LBUB-B.txt
done
#echo "\\end{tabular}\\end{figure}" >> LBUB/B/LBUB-B.txt


chaineZ=knapsack_instances/C/knapsack-C-
#echo "\\begin{figure}[!h]\\begin{tabular}{|r|r|r|r|r|}\\hline" >> LBUB/C/LBUB-C.txt
for i in $(seq 1 1 25);
do
    echo "C$i&" >> LBUB/C/LBUB-C.txt
    /Applications/Comet/comet -j2 knapsackUB_LB.co -f$chaineZ$i.txt >> LBUB/C/LBUB-C.txt
done
#echo "\\end{tabular}\\end{figure}" >> LBUB/C/LBUB-C.txt