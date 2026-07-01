#!/usr/bin/env python3

from datetime import datetime, timedelta
import time
import os
import logging
logging.basicConfig(level=logging.INFO)

def get_timestamp():
    now = datetime.now()
    result = now.strftime("%Y-%m-%d %H:%M:%S")
    return result

def log_with_time(message):
    result = get_timestamp()
    print(f"[{result}] {message}")

def is_recent(filepath, max_hours):
    mtime = os.path.getmtime(filepath)
    modified = datetime.fromtimestamp(mtime)
    if modified > datetime.now() - timedelta(hours=max_hours):
        return True
    else:
        return False
    
if __name__ == "__main__":
    print(get_timestamp())
    logging.info(f"Health check started")
    result = is_recent("main.py", 24)
    print(result)
