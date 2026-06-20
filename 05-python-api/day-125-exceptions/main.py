#!/usr/bin/env python3

def read_config(path):
    try:
        with open(path) as f:
            data = f.read()
            return data
    except FileNotFoundError:
        print(f"File not found: {path}")
        return None
    except PermissionError:
        print(f"Permission denied: {path}")
        return None

def parse_config(data):
    if data is None:
        return {}
    lines = data.split("\n")
    result = {}
    for line in lines:
        if not line:
            continue
        parts = line.split("=")
        result[parts[0]] = parts[1]
    return result

if __name__ == "__main__":
    result = read_config("config.txt")
    parsed = parse_config(result)
    print(parsed)