
# Log Archiver Script

This Bash script compresses log files from a specified directory into a `.tar.gz` archive, names the archive with a timestamp, and stores it in a separate archive directory. It also logs each archive action for future reference.

---

# Features

- Asks for the log directory interactively
- Compresses all files in the given directory
- Creates a `.tar.gz` archive with a timestamp
- Stores archives in a separate `<logdir>_archive` folder
- Logs all archive activity to `archive_log.txt`
- Stops immediately if archiving fails

---

# Output Structure

Given a log directory like:

```
/var/www/testlog
```

The script will create:

```
/var/www/testlog_archive/testlog_YYYYMMDD_HHMMSS.tar.gz
/var/www/testlog_archive/archive_log.txt
```

---

# How to Use

### 1. Make the script executable

```bash
chmod +x logscript.sh
```

### 2. Run the script

```bash
./logscript.sh
```

### 3. When prompted, enter the full path to your log directory:

```
Enter the log directory path: /var/www/testlog
```

---

## Error Handling

- If the directory does not exist, the script will exit with an error.
- If the archive operation fails (e.g., permission issues), the script will stop immediately.

---

## Sample Log Entry

The script writes archive activity to:

```
/var/www/testlog_archive/archive_log.txt

**## Automating with Cron**
Set a cronjob with desired time

PRoject URL:-

https://roadmap.sh/projects/log-archive-tool
