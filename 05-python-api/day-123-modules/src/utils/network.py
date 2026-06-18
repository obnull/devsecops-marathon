import random

def simulate_ping(host, timeout=1.0):
    latency = round(random.uniform(0.5, 120.0), 2)
    return {"host": host, "latency_ms": latency, "alive": latency < timeout * 100}

def is_port_in_range(port, start=1, end=65535):
    return start <= port <= end