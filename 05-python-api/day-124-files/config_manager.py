#!/usr/bin/env python3
"""Day 124: File I/O — JSON configs, CSV reports, text logs."""

import json
import csv
import os
from datetime import datetime


def load_json_config(filepath):
    with open(filepath, "r") as f:
        return json.load(f)


def save_json_config(data, filepath):
    with open(filepath, "w") as f:
        json.dump(data, f, indent=2)
    print(f"Saved to {filepath}")


def update_config_value(filepath, key, value):
    config = load_json_config(filepath)
    config[key] = value
    save_json_config(config, filepath)


def generate_csv_report(filepath, headers, rows):
    with open(filepath, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(headers)
        writer.writerows(rows)
    print(f"CSV saved to {filepath}")


def read_csv_report(filepath):
    with open(filepath, "r") as f:
        return list(csv.DictReader(f))


def append_to_log(filepath, message):
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    with open(filepath, "a") as f:
        f.write(f"[{timestamp}] {message}\n")


def read_last_lines(filepath, n=5):
    with open(filepath, "r") as f:
        lines = f.readlines()
        return lines[-n:] if len(lines) >= n else lines


def main():
    data_dir = "src/data"
    os.makedirs(data_dir, exist_ok=True)

    print("=" * 50)
    print("FILE I/O DEMO")
    print("=" * 50)

    # JSON
    print("\n--- JSON ---")
    json_path = os.path.join(data_dir, "config.json")
    config = {"app_name": "HostMonitor", "version": "1.0.0", "check_interval_sec": 30, "targets": ["web-01", "db-01"]}
    save_json_config(config, json_path)
    loaded = load_json_config(json_path)
    print(f"  Loaded: {loaded['app_name']} v{loaded['version']}")
    update_config_value(json_path, "check_interval_sec", 60)

    # CSV
    print("\n--- CSV ---")
    csv_path = os.path.join(data_dir, "report.csv")
    headers = ["Host", "CPU%", "Memory%", "Status"]
    rows = [["web-01", 45, 72, "OK"], ["db-01", 82, 91, "WARN"], ["cache-01", 12, 35, "OK"]]
    generate_csv_report(csv_path, headers, rows)
    for row in read_csv_report(csv_path):
        print(f"    {row['Host']}: CPU {row['CPU%']}%, Status={row['Status']}")

    # Log
    print("\n--- Log ---")
    log_path = os.path.join(data_dir, "monitor.log")
    append_to_log(log_path, "Monitor started")
    append_to_log(log_path, "WARNING: db-01 memory > 90%")
    append_to_log(log_path, "All checks completed")
    print("  Last 2 entries:")
    for line in read_last_lines(log_path, 2):
        print(f"    {line.strip()}")

    print("=" * 50)


if __name__ == "__main__":
    main()