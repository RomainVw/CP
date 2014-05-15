#!/bin/bash

function wait_and_kill() {
    sleep 120
    kill $1
}


for i in $(seq 1 5); do
echo "\hline"
arch -x86_64 /Applications/Comet//comet.app/Contents/MacOS/comet  VRPTW.co Instances/C10$i.txt &

pid=$!
wait_and_kill $pid &
wait $pid
done;

for i in $(seq 1 5); do
echo "\hline"
arch -x86_64 /Applications/Comet//comet.app/Contents/MacOS/comet  VRPTW.co Instances/R10$i.txt &

pid=$!
wait_and_kill $pid &
wait $pid
done;