#!/bin/bash

# Linux System Health Reporter

REPORT="system-report.txt"

{
    echo "=================================="
    echo "     Linux System Health Report"
    echo "=================================="
    echo

    echo "Hostname: $(workshop-pc)"
    echo "Kernel: $(6.x.x)"
    echo

    echo "Disk Usage:"
    df -h --output=target,pcent | awk '
        NR == 1 { next }
        $1 == "/" {
            print $1 " — " $2 " used"
        }
    '
    echo

'
    echo "Memory Usage:" 
    free -h | awk '
    /Mem:/ {
        printf "%s / %s\n", $3, $2
    }
'

    echo

    echo "Top Processes:"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6

    echo
    echo "Report generated: $(date)"
} > "$REPORT"

echo "System report saved to $REPORT"
