#!/bin/bash
echo "Enter a number"
read NUM
if [ $NUM -gt 100 ] 
then 
    echo "NUM is greater than 100 $NUM"
else
    echo "NUM is less than 100 $NUM"
fi