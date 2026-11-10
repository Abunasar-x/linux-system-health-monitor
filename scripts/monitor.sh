
#!/bin/bash

# Linux System Health Monitor
# Phase 1 and Phase 2

# Define project directory
PROJECT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"

# Define log file
LOG_FILE="$PROJECT_DIR/logs/system.log"

# Ensure log directory exists
if [ ! -d "$PROJECT_DIR/logs" ]; then
    mkdir -p "$PROJECT_DIR/logs" || {
        echo "ERROR: Unable to create log directory." >&2
        exit 1
    }
fi

DISK_THRESHOLD="${DISK_THRESHOLD:-80}"

DISK_USAGE=$(df -P / | awk 'NR==2 {gsub(/%/,"",$5); print $5}')

# Validate disk usage value
if [[ ! "$DISK_USAGE" =~ ^[0-9]+$ ]]; then
    echo "ERROR: Unable to determine root filesystem disk usage." >&2
    exit 1
fi

{
    echo "========================================"
    echo "       LINUX SYSTEM HEALTH REPORT"
    echo "========================================"

    echo ""
    echo "Date and Time: $(date)"
    echo "Hostname: $(hostname)"

    echo ""
    echo "----- KERNEL INFORMATION -----"
    uname -r

    echo ""
    echo "----- SYSTEM UPTIME -----"
    uptime

    echo ""
    echo "----- DISK USAGE -----"
    df -h

    echo "----- DISK THRESHOLD CHECK -----"
    echo "Root filesystem usage: ${DISK_USAGE}%"

    if [ "$DISK_USAGE" -ge "$DISK_THRESHOLD" ]; then
        echo "WARNING: Disk usage is ${DISK_USAGE}% (Threshold: ${DISK_THRESHOLD}%)"
    else
        echo "Status: Normal - Disk usage is ${DISK_USAGE}%"
    fi

    echo ""
    echo "----- MEMORY USAGE -----"
    free -h

    echo ""

    echo "----- CPU LOAD -----"
    uptime

    echo ""
    echo "========================================"
    echo ""

} >> "$LOG_FILE"

echo "System health report generated successfully."
echo "Log location: $LOG_FILE"

