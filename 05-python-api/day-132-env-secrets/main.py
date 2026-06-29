#!/usr/bin/env python3

from dotenv import load_dotenv
import os
import logging
logging.basicConfig(level=logging.WARNING)
required_vars = ["GITHUB_TOKEN", "MONITOR_INTERVAL", "TARGET_HOST"]

load_dotenv()

for var in required_vars:
    if os.getenv(var) is None:
        logging.warning(f"Missing environment variable: {var}")

token = os.getenv("GITHUB_TOKEN")
monitor = os.getenv("MONITOR_INTERVAL")
host = os.getenv("TARGET_HOST")

print(f"{token}\n{monitor}\n{host}")