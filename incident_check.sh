#!/bin/bash

STATUS=0

if [ -z "$1" ]; then
  echo "USAGE: $0 <process_name>"
  exit 2
fi


# Process check
PROCESS="$1"

if pgrep "$PROCESS" > /dev/null; then
  echo "OK: Process $PROCESS is running"
else
  echo "CRITICAL: Process $PROCESS is NOT running"
  STATUS=2
fi


# Disk usgae ckeck
DISK_USAGE=$( df -h / | tail -1 | awk '{print $5}' | tr -d '%')
if [ "$DISK_USAGE" -ge 80 ]; then
  echo "CRITICAL: Disk usage is ${DISK_USAGE}%"
  STATUS=2
else
  echo "OK: Disk usage is ${DISK_USAGE}%"
fi


# System load check
LOAD=$( uptime | awk -F'load average: ' '{print $2}' | awk -F',' '{print $1}')

if awk "BEGIN {exit !($LOAD > 5)}"; then
  echo "CRITICAL: System load is $LOAD"
  STATUS=2
else
  echo "OK: System load is $LOAD"
fi


echo "FINAL STATUS: $( [ $STATUS -eq 0 ] && echo HEALTHY || echo UNHEALTHY )"
exit $STATUS
