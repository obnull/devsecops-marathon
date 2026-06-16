#!/usr/bin/env python3

import os
import random

def check_http_response(status_code: int, treshhold: int = 400) -> bool:
    return status_code < treshhold

def collect_metrics(*ports: int) -> dict:
    metrics = {}
    for port in ports:
        metrics[port] = round(random.uniform(0.1, 1.5), 3)
    return metrics

def format_alert(**details) -> str:
    host = details.get("host", "unknown")
    issue = details.get("issue", "unspecified")
    severity = details.get("severity", "LOW")
    return f"[{severity}] {host}: {issue}"

def check_endpoints(endpoints: list, checker_func) -> list:
    failed = []
    for name, status in endpoints:
        if not checker_func(status):
            failed.append((name, status))
    return failed

def analyze_server(hostname: str) -> tuple:
    cpu = random.randint(10, 95)
    memory = random.randint(20, 98)
    disk = random.randint(30, 80)
    return cpu, memory, disk

def main():
    print("=" * 60)
    print("  HOST CHECKER UTILITY")
    print("=" * 60)

    print("\n--- HTTP Status Checks ---")
    statuses = [200, 301, 404, 500, 503]
    for s in statuses:
        result = check_http_response(s)
        status_text = "  OK" if result else " FAIL"
        print(f"{s}: {status_text}")

    print(f"\n--- Port Metrics (*args) ---")
    port_metrics = collect_metrics(80, 443, 8080, 3000, 5432)
    for port, resp_time in port_metrics.items():
        print(f"  Port {port}: {resp_time}s")

    print("\n--- Alert Formatting (**kwargs) ---")
    alert = format_alert(
        host="web-prod-01",
        issue="SSL certificate expires in 3 days",
        severity="HIGH"
    )
    print(f"  {alert}")

    print("\n--- Endpoint Monitoring (function as argument) ---")
    endpoints = [
        ("/api/health", 200),
        ("/api/users", 401),
        ("/api/admin", 500),
        ("/api/status", 200),
    ]
    failed_endpoints = check_endpoints(endpoints, check_http_response)
    
    if failed_endpoints:
        print(f"  Failed endpoints: {len(failed_endpoints)}")
        for name, status in failed_endpoints:
            print(f"     {name}: {status}")
    else:
        print("  All endpoints healthy")

    # 5. Возврат нескольких значений (tuple unpacking)
    print("\n--- Server Analysis (multiple return values) ---")
    cpu, mem, disk = analyze_server("web-01")
    print(f"  CPU: {cpu}%")
    print(f"  Memory: {mem}%")
    print(f"  Disk: {disk}%")
    
    # Пороговая проверка
    if cpu > 90 or mem > 90:
        print(f"  ⚠️  Resource threshold exceeded!")

    print("=" * 60)


if __name__ == "__main__":
    main()