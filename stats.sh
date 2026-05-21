#!/bin/bash

# set -x

#total cpu usage
top -bn1 

#memory used by percentage
echo "memory usage by percentage"
free | awk '/Mem:/ {used=$3/$2*100;free=$4/$2*100;printf("Used:%.2f%% | free:%.2f%%\n",used,free)}'

#space used by percentage
echo "space used by percentage"
df -h --total | awk '/^total/ {perc=$5;printf("total percentage used: %s%\n", perc)}'

#top 5 process by memory
echo "top 5 process by mem"
ps aux --sort=-%mem | head -6

#top 5 process by size
echo "top 5 process by size"
ps aux --sort=-vsz | head -6


