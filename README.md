# CleanOldLogs

## Description
This PowerShell script automates the cleanup of old log files in a specified directory. It deletes log files that are older than a configured number of days and schedules the task to run weekly.

## Features
- **Deletes old log files**: Automatically removes log files older than a specified number of days.
- **Configurable retention period**: Adjust the `$retentionPeriod` variable to set how many days to keep logs.
- **Weekly cleanup**: Schedules the task to run weekly.

## Prerequisites
- Windows PowerShell
- Administrator privileges

## Installation
1. Customize the log directory and retention period (`$logDirectory` and `$retentionPeriod`) as needed.
2. Download and save the script as `CleanOldLogs.ps1`.
3. Run the script in PowerShell with administrator privileges to set up the scheduled task.

## Usage
- The script will clean up old log files in the specified directory weekly.
- Customize the retention period to meet your needs.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
