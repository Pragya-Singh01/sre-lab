#!/bin/bash

THRESHOLD=80
USAGE=$( df / | tail -1 | awk '{print $5}' | tr -d '%')
if [ "$USAGE" -ge "$THRESHOLD" ]; then
   echo "CRITICAL: Disk usage is ${USAGE}%"
   exit 2
else
   echo "OK: Disk usage is ${USAGE}%"
   exit 0
fi
