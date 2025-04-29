#!/bin/bash

while true; do
  echo "[cleaner] Scanning for deleted open files..."
  lsof +L1 | awk '/deleted/ {print $2, $4}' | while read -r pid fd; do
    fd_num=$(echo "$fd" | sed 's/[^0-9]*//g')
    if [ -e "/host/proc/$pid/fd/$fd_num" ]; then
      echo "[cleaner] Truncating deleted file: PID=$pid FD=$fd_num"
      : > "/host/proc/$pid/fd/$fd_num"
    fi
  done
  sleep 300  # каждые 5 минут
done
