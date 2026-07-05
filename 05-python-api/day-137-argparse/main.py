import argparse
import socket

def check_port(host, port):
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.settimeout(1)
    result = sock.connect_ex((host, port))
    sock.close()
    return result == 0

parser = argparse.ArgumentParser(description="Port checker")
parser.add_argument("--host", required=True, help="Target host")
parser.add_argument("--ports", required=True, nargs="+", type=int, help="Ports to check")
args = parser.parse_args()


if __name__ == "__main__":
    for port in args.ports:
        result = check_port(args.host, port)
        print(f"{args.host}:{port} - {'open' if result else 'closed'}")