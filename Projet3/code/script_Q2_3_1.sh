#!/bin/bash

chaineZ=knapsack_instances/A/knapsack-A-

for i in $(seq 1 1 25);
do
    /Applications/Comet/comet -j2 knapsack.co -f$chaineZ$i.txt > fff$i.txt
done