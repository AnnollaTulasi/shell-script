#!/bin/bash

echo "Please enter the Username:"
#read USERNAME #the value is visible
read -s USERNAME #this is not visible
echo "the enter value for username is ${USERNAME}"