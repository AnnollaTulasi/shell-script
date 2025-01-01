#!/bin/bash
echo "Enter a day so that we confirm whether it is holiday or not"
read DAY
echo "DAY entered is $DAY"
if [ $DAY != SUNDAY ]
then 
    echo "Go to School"
else
    echo "Today is holiday,enjoy"
fi
