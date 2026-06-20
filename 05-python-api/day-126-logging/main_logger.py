#!/usr/bin/env python3

import logging

logging.basicConfig(
    level = logging.DEBUG,
    format="%(asctime)s - %(levelname)s - %(message)s",
    filename="app.log"
)

def read_config(path):
    try:
        with open(path) as f:
            data = f.read()
            logging.info(f"Config loaded: {path}")
            return data
    except FileNotFoundError:
        logging.error(f"File not found: {path}")
        return None
    except PermissionError:
        logging.error(f"Permission denied: {path}")
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
    logging.info(f"Parsed config: {parsed}")