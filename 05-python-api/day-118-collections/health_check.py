#!/usr/bin/env python3
"""
Day 118: Working with dicts - simulating API responses.
In real live, this data comes from requests.get().json()
"""

server_health= {
    "hostname": "web-01",
    "ip": "10.0.1.15",
    "services": {
        "nginx": "running",
        "postgresql": "running",
        "redis": "degraded"
    },
    "metrics": {
        "cpu_percent": 42.5,
        "memory_used_gb": 7.2,
        "disk_free_gb": 128.0
    },
    "active_connections": 234,
    "last_errors": [
        "2025-04-01 10:15:23 - timeout is redis"
        "2025-04-01 09:45:01 - SSL cert near expiry"
    ]
}

def check_service_health(health_data: dict) -> dict:
    """Analyze health data and flag problems"""
    problems = []

    for service, status in health_data["services"].items():
        if status != "running":
            problems.append(f" {service}: {status}")
        
        if health_data["metrics"]["cpu_percent"] > 80:
            problems.append(f"CPU: {health_data['metrics']['cpu_percent']}%")

        if len(health_data["last_errors"]) > 5:
            problems.append(f"{len(health_data['last_errors'])} recent errors")

        return {
            "host": health_data["hostname"],
            "healthy": len(problems) == 0,
            "problems": problems,
            "connection_count": health_data["active_connections"]
        }
    
def main():
    print("=" * 50)
    print(f" Health check: {server_health['hostname']}")
    print("=" * 50)
    print(f"CPU: {server_health['metrics']['cpu_percent']}%")
    print("=" * 50)
    print(f"Memory: {server_health['metrics']['memory_used_gb']}GB")
    print(f"Services: {len(server_health['services'])} total")
    print(f"Redis status: {server_health['services']['redis']}")
    print()

    result = check_service_health(server_health)

    print("Health Report:")
    print(f"    Host: {result['host']}")
    print(f"Status: {'    Healthy' if result['healthy'] else '   Issues Found'}")
    print(f"    Connections: {result['connection_count']}")

    if result["problems"]:
        print("    Problems:")
        for p in result['problems']:
            print(f"    {p}")

    uptime = server_health.get("uptime_days", "N/A")
    print(f"  Uptime data: {uptime}")
    print("=" * 50)

if __name__ == "__main__":
    main()