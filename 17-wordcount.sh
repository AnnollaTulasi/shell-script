#!/bin/bash
while read -r word
do
    echo "$word"
    wc $word
done >>15-while.sh