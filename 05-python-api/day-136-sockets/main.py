import socket

def check_port(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((host, port))
    sock.close()
    return result == 0

if __name__ == "__main__":
    ports = [80, 443, 8080]
    for port in ports:
        result = check_port("google.com", port)
        print(f"google.com:{port} - {'open' if result else 'closed'}")