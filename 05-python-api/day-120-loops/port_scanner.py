#!/usr/bin/env python3
"""
Day 120: Loops in action — simple port range scanner.
In real life, this would use sockets. Here we focus on loop logic.
"""

def scan_ports_simple(host: str, start_port: int, end_port: int) -> list:
    """Simulate port scanning. Returns list of 'open' ports."""
    # В реальности здесь был бы socket.connect()
    # Сейчас просто показываем логику перебора
    
    open_ports = []
    
    for port in range(start_port, end_port + 1):
        # Имитация: чётные порты открыты, порты с цифрой 3 — закрыты
        is_open = (port % 2 == 0) and ("3" not in str(port))
        
        if is_open:
            open_ports.append(port)
    
    return open_ports


def classify_ports(ports: list) -> dict:
    """Classify ports as system, registered, or dynamic."""
    classified = {
        "system": [],      # 1-1023
        "registered": [],  # 1024-49151
        "dynamic": []      # 49152-65535
    }
    
    for port in ports:
        if port < 1024:
            classified["system"].append(port)
        elif port < 49152:
            classified["registered"].append(port)
        else:
            classified["dynamic"].append(port)
    
    return classified


def find_suspicious_ports(ports: list) -> list:
    """Check if any known-dangerous ports are open."""
    suspicious_ports = {
        21: "FTP (plaintext)",
        23: "Telnet (insecure)",
        25: "SMTP (open relay?)",
        135: "RPC (Windows)",
        445: "SMB (EternalBlue)",
        1433: "MSSQL",
        3306: "MySQL (external access?)",
        3389: "RDP",
        5432: "PostgreSQL (external access?)",
        6379: "Redis (no auth?)",
        27017: "MongoDB (no auth?)"
    }
    
    found = {}
    for port in ports:
        if port in suspicious_ports:
            found[port] = suspicious_ports[port]
    
    return found


def main():
    target = "192.168.1.100"
    port_range = (1, 1024)  # Сканируем системные порты
    
    print("=" * 60)
    print(f"  PORT SCAN: {target}")
    print(f"   Range: {port_range[0]}-{port_range[1]}")
    print("=" * 60)
    
    # FOR LOOP: перебор портов
    open_ports = scan_ports_simple(target, *port_range)
    
    print(f"\n Open ports: {len(open_ports)}")
    
    # FOR LOOP с enumerate (индекс + значение)
    print("\nPort list:")
    for i, port in enumerate(open_ports, 1):
        print(f"   {i}. {port}")
    
    # Классификация
    classified = classify_ports(open_ports)
    
    print(f"\n Classification:")
    for category, ports_list in classified.items():
        if ports_list:
            print(f"   {category}: {len(ports_list)} ports")
            print(f"      Range: {min(ports_list)}-{max(ports_list)}")
    
    # Проверка на подозрительное
    suspicious = find_suspicious_ports(open_ports)
    if suspicious:
        print(f"\n SUSPICIOUS PORTS FOUND:")
        for port, service in suspicious.items():
            print(f"   • {port}: {service}")
    
    # WHILE LOOP: демонстрация retry-логики
    print(f"\n RETRY DEMO (while loop):")
    max_retries = 3
    attempt = 0
    while attempt < max_retries:
        attempt += 1
        success = attempt == 3
        print(f"   Attempt {attempt}/{max_retries}... {'✅' if success else '❌'}")
        if success:
            print("   Connected!")
            break
    else:
        print("   Failed after all retries!")
    
    print("=" * 60)


if __name__ == "__main__":
    main()