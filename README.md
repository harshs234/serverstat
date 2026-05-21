# Server Stats

A simple Bash script that displays basic server statistics from a Linux system.

## Features

- Live dashboard that refreshes system statistics every second
- Shows current CPU usage information
- Displays memory usage percentage
- Displays disk usage percentage
- Lists the top 5 processes by memory usage
- Lists the top 5 processes by virtual memory size (VSZ)

## Requirements

- Linux-based system
- Bash shell
- Common Linux utilities:
  - `top`
  - `free`
  - `df`
  - `ps`
  - `awk`

## Usage

Make the script executable:

```bash
chmod +x stats.sh
```
Run the script:
```bash
./stats.sh
```

## Example Output

```text
memory usage by percentage
used: 35.42% | free: 12.84% | cache memory : 4.11%

space used by percentage
total percentage used: 20%

top 5 process by mem
USER       PID %CPU %MEM COMMAND
...

top 5 process by size
USER       PID %CPU %MEM COMMAND
...
```

## Project URL

This project is based on the Server Stats challenge from roadmap.sh:

https://roadmap.sh/projects/server-stats
