#!/bin/bash
# set -x

CMD_MAX=30  # max chars for COMMAND column

trim_cmd() {
    awk -v max="$CMD_MAX" '
    NR==1 { print; next }
    {
        cmd = ""
        for (i=11; i<=NF; i++) cmd = (cmd=="" ? $1 : cmd" ") (i==11 ? $i : $i)
        # rebuild cmd from field 11 onward
        cmd = ""
        for (i=11; i<=NF; i++) cmd = (i==11) ? $i : cmd" "$i
        if (length(cmd) > max) cmd = substr(cmd, 1, max-1)"…"
        printf "%-10s %-6s %-6s %-6s %-6s %-6s %-6s %-6s %-6s %-6s %s\n",
               $1,$2,$3,$4,$5,$6,$7,$8,$9,$10, cmd
    }' 
}

while true; do
    # total cpu usage — header lines only, no process table
    output=$(top -bn1 | head -6)
    output+=$'\n'

    # memory used by percentage
    output+=$'\nmemory usage(%): '
    output+=$(free | awk '/Mem:/ {used=$3/$2*100;free=$4/$2*100;buff=$6/$2*100;printf("%.2f%% | free:%.2f%% | cache memory:%.2f%%\n",used,free,buff)}')
    output+=$'\n'

    # space used by percentage
    output+=$'\nspace usage(%): '
    output+=$(df -h --total | awk '/^total/ {perc=$5;printf("%s\n", perc)}')
    output+=$'\n'

    # top 5 process by memory
    output+=$'\nTOP 5 PROCESS BY MEMORY\n'
    output+=$(ps aux --sort=-%mem | head -6 | trim_cmd)
    output+=$'\n'

    # top 5 process by size
    output+=$'\nTOP 5 PROCESS BY SIZE\n'
    output+=$(ps aux --sort=-vsz | head -6 | trim_cmd)
    output+=$'\n'

    clear
    echo "$output"
    sleep 0.5
done
