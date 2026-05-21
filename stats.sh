#!/bin/bash

# set -x

while true 
do
	#total cpu usage
	output=$(top -bn1)
	output+=$'\n'

	#memory used by percentage
	output+=$'\nmemory usage(%): '
	output+=$(free | awk '/Mem:/ {used=$3/$2*100;free=$4/$2*100;buff=$6/$2*100;printf("%.2f%% | free:%.2f%% | cache memory:%.2f%%\n",used,free,buff)}')
	output+=$'\n'
       	
	#space used by percentage
	output+=$'\nspace usage(%): '
	output+=$(df -h --total | awk '/^total/ {perc=$5;printf("%s\n", perc)}')
	output+=$'\n'

	#top 5 process by memory
	output+=$'\nTOP 5 PROCESS BY MEMORY\n'
	output+=$(ps aux --sort=-%mem | head -6)
	output+=$'\n'

	#top 5 process by size
	output+=$'\nTOP 5 PROCESS BY SIZE\n'
	output+=$(ps aux --sort=-vsz | head -6)
	output+=$'\n'
	
	clear
	echo "$output"
	sleep 0.5
done

