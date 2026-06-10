#!/usr/bin/env python3
"""
Day 118: Lists and sets for log analysis.
Find unique IPs and count requests per IP.
"""

raw_logs = [
    "192.168.1.10 - - [04/Apr/2025:10:15:23] \"GET /index.html HTTP/1.1\" 200",
    "10.0.0.5 - - [04/Apr/2025:10:15:24] \"POST /api/login HTTP/1.1\" 401",
    "192.168.1.10 - - [04/Apr/2025:10:15:25] \"GET /style.css HTTP/1.1\" 200",
    "172.16.0.1 - - [04/Apr/2025:10:15:26] \"GET /admin HTTP/1.1\" 403",
    "10.0.0.5 - - [04/Apr/2025:10:15:27] \"POST /api/login HTTP/1.1\" 401",
    "192.168.1.10 - - [04/Apr/2025:10:15:28] \"GET /favicon.ico HTTP/1.1\" 404",
    "10.0.0.99 - - [04/Apr/2025:10:15:29] \"GET /health HTTP/1.1\" 200",
]

def extract_ip(log_line: str) -> str:
    """Extract IP address from log line"""
    return log_line.split()[0]

def main():
    
    all_ips = []
    
    for line in raw_logs:
       ip = extract_ip(line)
       all_ips.append(ip)

    unique_ips = set(all_ips)

    ip_counter = {}

    for ip in all_ips:
        if ip in ip_counter:
            ip_counter[ip] += 1
        else:
            ip_counter[ip] = 1
    
    print("=" * 50)
    print("LOG ANALYSIS")
    print(f"Total requests: {len(raw_logs)}")
    print(f"unique IPs {len(unique_ips)}")
    print(f"IPs seen {unique_ips}")
    print()
    print("Requests per IP:")
    for ip, count in ip_counter.items():
        print(f"  {ip}: {count} requests")

    monitored_endpoints = ("/admin", "/api/login", "/.env")
    print(f"\nMonitored endpoints: {monitored_endpoints}")

    suspicious = []

    for line in raw_logs:
        for endpoint in monitored_endpoints:
            if endpoint in line and "403" in line:
                ip = extract_ip(line)
                suspicious.append(ip)

    if suspicious:
        print(f"    Suspicious activity from: {set(suspicious)}")
        print("=" * 50)
    
if __name__ == "__main__":
        main()