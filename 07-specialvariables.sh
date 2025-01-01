#!/bin/bash

echo "All variables $@"
echo "Number of variables $#"
echo "Home DIRECTORY $HOME"
echo "PWD DIRECTORY $PWD"
echo "PID of current script $$"
sleep 10 &
echo "PID of last command in background $!"
echo "name of the scriptfile $0"
echo "which user is running the script $USER"
