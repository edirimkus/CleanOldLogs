# Define the log directory and retention period (in days)
$logDirectory = "C:\Logs"
$retentionPeriod = 30

# Function to delete old log files
function Clean-OldLogs {
    $currentDate = Get-Date
    $files = Get-ChildItem -Path $logDirectory -File

    foreach ($file in $files) {
        $fileAge = ($currentDate - $file.CreationTime).Days
        if ($fileAge -gt $retentionPeriod) {
            Remove-Item -Path $file.FullName -Force
            Write-Output "Deleted old log file: $($file.Name)"
        }
    }
}

# Schedule the cleanup to run weekly
$trigger = New-ScheduledTaskTrigger -Weekly -At "03:00AM" -DaysOfWeek Sunday
$action = New-ScheduledTaskAction -Execute "PowerShell.exe" -Argument "-File `"$PSScriptRoot\CleanOldLogs.ps1`""
Register-ScheduledTask -Action $action -Trigger $trigger -TaskName "CleanOldLogs" -Description "Cleans up old log files weekly" -User "$env:UserName" -RunLevel Highest -Force

# Run the cleanup function
Clean-OldLogs
