#!/usr/bin/env python3
from utils.network import simulate_ping, is_port_in_range
from utils.formatters import format_table, severity_color
from checks import check_http_status, check_resource_usage

def main():
    hosts = ["web-01", "db-01", "cache-01", "worker-01"]
    
    print("=" * 50)
    print("🖥️  HOST MONITOR (modular)")
    print("=" * 50)
    
    print("\n--- Network ---")
    for host in hosts:
        r = simulate_ping(host)
        print(f"  {'✅' if r['alive'] else '❌'} {r['host']}: {r['latency_ms']}ms")
    
    print("\n--- HTTP Status ---")
    for host in hosts:
        r = check_http_status(host)
        print(f"  {'✅' if r['healthy'] else '❌'} {r['host']}:{r['port']} -> {r['status']}")
    
    print("\n--- Resources ---")
    for host in hosts:
        r = check_resource_usage(host)
        cpu, mem = r["cpu_percent"], r["memory_percent"]
        sev = "HIGH" if cpu > 90 or mem > 90 else ("MEDIUM" if cpu > 70 or mem > 80 else "LOW")
        print(f"  {severity_color(sev)} {r['host']}: CPU {cpu}%, MEM {mem}%, DISK {r['disk_percent']}%")
    
    print("\n--- Port Validation ---")
    for port in [80, 443, 8080, 99999]:
        valid = is_port_in_range(port)
        print(f"  {'✅' if valid else '❌'} Port {port}: {'valid' if valid else 'invalid'}")
    
    print(f"\nModule location: {__name__}")

if __name__ == "__main__":
    main()