#!/usr/bin/env python3

import logging
import subprocess
logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

def check_disk(path):
    process = subprocess.run(["df", "-h", path], capture_output=True, text=True)
    result = process.stdout
    logging.info(f"Disk memory check complete! {path}")
    return result

def check_memory():
    process = subprocess.run(["free", "-h"], capture_output=True, text=True)
    result = process.stdout
    logging.info(f"Free memory check complete!")
    return result

if __name__ == "__main__":
    result = check_disk("/")
    result2 = check_memory()
    print(result)
    print(result2)