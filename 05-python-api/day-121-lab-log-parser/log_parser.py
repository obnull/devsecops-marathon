#!/usr/bin/env python3

def parse_line(line) -> str:
    st = line.split()
    return {
        "ip": st[0],
        "method": st[4].strip('"'),
        "path": st[5],
        "status": int(st[7])
    }

def load_logs(filepath):
    with open(filepath) as f:
        entries = []
        for line in f:
            clean_line = line.strip()
            if clean_line == "":
                continue
            data = parse_line(clean_line)
            entries.append(data)
        return entries

def count_statuses(entries):
    counts = {
        "2xx": 0,
        "3xx": 0,
        "4xx": 0,
        "5xx": 0
    }
    
    for entry in entries:
        status = entry["status"]
        if 200 <= status <= 299:
            counts["2xx"] += 1
        elif 300 <= status <= 399:
            counts["3xx"] += 1
        elif 400 <= status <= 499:
            counts["4xx"] += 1
        elif 500 <= status <= 599:
            counts["5xx"] += 1
    return counts

def top_ips(entries, limit=3):
    ip_count = {}

    for entry in entries:
        current_ip = entry["ip"]
        if current_ip in ip_count:
            ip_count[current_ip] += 1
        else:
            ip_count[current_ip] = 1
    
    cort = list(ip_count.items())
    sort_ip = sorted(cort, key=lambda x: x[1], reverse=True)
    return sort_ip[:limit]

def find_404_paths(entries):
    paths_404 = []

    for entry in entries:
        if entry["status"] == 404:
            id_path = entry["path"]
            if id_path not in paths_404:
                paths_404.append(id_path)
    return paths_404

def generate_report(entries, source):
    total_requests = len(entries)
    uniqum_ip = len({entry["ip"] for entry in entries})
    statuses = count_statuses(entries)
    top = top_ips(entries)
    path = find_404_paths(entries)
    top_lines = "\n".join([f"    {ip} — {count} requests" for ip, count in top])
    path_lines = "\n".join([f"    {p}" for p in path]) if path else "    None"

    report = f"""=======================================
REPORT WITH LOGS FOR FILE {source}
=======================================
Total count requests: {total_requests}
=======================================
Uniqum IP requests: {uniqum_ip}
---------------------------------------
Code response statistics:
    2xx: {statuses['2xx']}
    3xx: {statuses['3xx']}
    4xx: {statuses['4xx']}
    5xx: {statuses['5xx']}
---------------------------------------
Top active IP addresses:
{top_lines}
---------------------------------------
Found URL with 404 error:
{path_lines}
======================================="""
    return report

def main():
    log_file = "access.log"
    entries = load_logs(log_file)
    report = generate_report(entries, log_file)
    print(report)
    with open('report.txt', 'w') as f:
        f.write(report)
    print("Report is saved!")

if __name__ == "__main__":
    main()
