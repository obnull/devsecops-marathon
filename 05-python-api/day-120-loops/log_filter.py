#!/usr/bin/env python3
"""
Day 120: Loop patterns for log processing.
Filter, transform, aggregate — bread and butter of DevOps.
"""

access_log = [
    '192.168.1.10 - - [04/Apr/2025:10:15:23] "GET /index.html HTTP/1.1" 200 2326',
    '10.0.0.5 - - [04/Apr/2025:10:15:24] "POST /api/login HTTP/1.1" 401 42',
    '192.168.1.10 - - [04/Apr/2025:10:15:25] "GET /style.css HTTP/1.1" 200 1234',
    '172.16.0.1 - - [04/Apr/2025:10:15:26] "GET /admin HTTP/1.1" 403 18',
    '10.0.0.5 - - [04/Apr/2025:10:15:27] "POST /api/login HTTP/1.1" 401 42',
    '192.168.1.10 - - [04/Apr/2025:10:15:28] "GET /favicon.ico HTTP/1.1" 404 5',
    '10.0.0.99 - - [04/Apr/2025:10:15:29] "GET /health HTTP/1.1" 200 15',
    '10.0.0.5 - - [04/Apr/2025:10:15:30] "GET /api/data HTTP/1.1" 500 89',
    '172.16.0.1 - - [04/Apr/2025:10:15:31] "GET /.env HTTP/1.1" 404 5',
    '192.168.1.50 - - [04/Apr/2025:10:15:32] "GET /wp-admin HTTP/1.1" 404 12',
]


def parse_log_line(line: str) -> dict:
    """Parse single log line into components."""
    parts = line.split()
    return {
        "ip": parts[0],
        "method": parts[4].strip('"'),
        "path": parts[5],
        "status": int(parts[7]),
        "size": int(parts[8])
    }


def main():
    parsed_logs = []
    for line in access_log:
        parsed_logs.append(parse_log_line(line))
    
    print("=" * 60)
    print(f" LOG ANALYSIS ({len(parsed_logs)} entries)")
    print("=" * 60)
    

    errors = [entry for entry in parsed_logs if entry["status"] >= 400]
    print(f"\n Error entries: {len(errors)}")
    for err in errors:
        print(f"   {err['ip']} -> {err['path']} ({err['status']})")
    

    successful = [e for e in parsed_logs if 200 <= e["status"] < 300]
    print(f"\n Successful: {len(successful)}")
    

    ip_stats = {}
    for entry in parsed_logs:
        ip = entry["ip"]
        if ip not in ip_stats:
            ip_stats[ip] = {"requests": 0, "errors": 0, "total_bytes": 0}
        ip_stats[ip]["requests"] += 1
        ip_stats[ip]["total_bytes"] += entry["size"]
        if entry["status"] >= 400:
            ip_stats[ip]["errors"] += 1
    
    print(f"\n Per-IP Statistics:")
    for ip, stats in ip_stats.items():
        error_rate = (stats["errors"] / stats["requests"]) * 100
        print(f"   {ip}: {stats['requests']} req, "
              f"{stats['total_bytes']} bytes, "
              f"{error_rate:.1f}% errors")
    

    print(f"\n Finding first problematic IP...")
    for entry in parsed_logs:
        if entry["status"] >= 500:
            print(f"   First server error from: {entry['ip']} ({entry['path']})")
            break
    

    print(f"\n API requests only (skip static):")
    for entry in parsed_logs:
        if entry["path"].endswith((".css", ".js", ".ico", ".png")):
            continue 
        print(f"   {entry['method']} {entry['path']} -> {entry['status']}")
    
    print("=" * 60)


if __name__ == "__main__":
    main()