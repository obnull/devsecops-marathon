#!/usr/bin/env python3

import logging
import os 
import stat
import json
logging.basicConfig(
    level=logging.DEBUG,
    format = "%(asctime)s - %(levelname)s - %(message)s"
)

folder = "/home/obnull/devsecops-marathon/05-python-api/day-127-lab-audit"

def audit_folder(folder):
    report = []
    for filename in os.listdir(folder):
        filepath = os.path.join(folder, filename)
        info = os.stat(filepath)
        mode = oct(info.st_mode)[-3:]
        status = "WARNING" if mode == "777" else "OK"
        if status == "WARNING":
            logging.warning(f"{filename} - {mode} - {status}")
        else:
            logging.info(f"{filename} - {mode} - {status}")
        entry = {
            "file": filename,
            "mode": mode,
            "status": status
        }
        report.append(entry)
    return report
        
def save_report(report, path):
    with open(path, "w") as f:
        json.dump(report, f, indent=4)

if __name__ == "__main__":
    report = audit_folder(folder)
    save_report(report, "report.json")