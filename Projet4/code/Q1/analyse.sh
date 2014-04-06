#!/bin/bash

function wait_and_kill() {
    sleep 300
    kill $1
}

echo "\hline"
for i in $(seq 3 10); do
    /Applications/Comet/comet -qj2 socialGolfer_integerModel.co $i &
    pid=$!
    wait_and_kill $pid &
    wait $pid
done;