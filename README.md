# Linux System Health Monitor

A Bash-based system monitoring tool that collects essential Linux system information, monitors resource usage, checks disk space against a configurable threshold, and automatically generates reports using Cron.

## Features

System Information: Displays hostname, date, kernel version, and system uptime.
Disk Monitoring: Displays filesystem usage and checks root filesystem usage against a configurable threshold.
Memory Monitoring: Reports total, used, and available memory.
CPU Monitoring: Displays system load averages.
Threshold Alerts: Generates a warning when disk usage reaches or exceeds the configured threshold.
Automated Logging: Saves monitoring reports to a log file.
Cron Automation: Runs the monitoring script automatically at scheduled intervals.
Error Handling: Creates the log directory when missing and validates disk usage data.

## Technologies Used

 Linux
 Bash Scripting
 Cron
 Ubuntu
 Linux command-line utilities

## Project Structure

```text
linux-system-health-monitor/
├── scripts/
│   └── monitor.sh
├── logs/
│   └── .gitkeep
├── screenshots/
│   └── .gitkeep
├── .gitignore
├── README.md
```

## Requirements

- Linux environment
- Bash
- Cron
- Standard Linux utilities: `df`, `awk`, `free`, `uptime`, and `hostname`

## Installation and Usage

Clone the repository:

```bash
git clone https://github.com/Abunasar-x/linux-system-health-monitor.git
```

Navigate to the project directory:

```bash
cd linux-system-health-monitor
```

Make the script executable:

```bash
chmod +x scripts/monitor.sh
```

Run the monitoring script:

```bash
bash scripts/monitor.sh
```

View the generated report:

```bash
cat logs/system.log
```

## Disk Usage Threshold

The default disk usage warning threshold is **80%**.

You can override it when running the script:

```bash
DISK_THRESHOLD=90 bash scripts/monitor.sh
```

This changes the threshold to 90% for that execution only. The default remains 80%.

## Cron Automation

To schedule the monitoring script to run every five minutes:

Open your crontab:

```bash
crontab -e
```

Add the following entry, replacing `/absolute/path/to` with your actual project directory:

```cron
*/5 * * * * /bin/bash /absolute/path/to/linux-system-health-monitor/scripts/monitor.sh
```

Verify the scheduled job:

```bash
crontab -l
```

## Learning Objectives

This project provided practical experience with:

- Bash scripting and conditional statements
- Linux system monitoring commands
- Environment variables
- File and directory management
- Output redirection and logging
- Cron job scheduling
- Basic error handling

## Future Improvements

- Email notifications for critical system alerts
- CPU and memory threshold alerts
- Improved error and execution logging


