import random

def check_http_status(host, port=443):
    status = random.choice([200, 200, 200, 301, 404, 500])
    return {"host": host, "port": port, "status": status, "healthy": 200 <= status < 400}

def check_resource_usage(host):
    return {"host": host, "cpu_percent": random.randint(10, 95), "memory_percent": random.randint(20, 98), "disk_percent": random.randint(30, 85)}
