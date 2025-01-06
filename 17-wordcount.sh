#!/bin/bash
while read -r word
do
    wc $word
done >>15-while.sh