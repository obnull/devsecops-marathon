#!/usr/bin/env python3

import requests
import logging
logging.basicConfig(
    level=logging.DEBUG,
    format = '%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

def check_service(url):
    try:
        r = requests.get(url)
        if r.status_code == 200:
            logging.info(f"INFO {url}")
        else:
            logging.warning(f"WARNING {url}")
        return r.status_code
    except requests.exceptions.ConnectionError:
        logging.error(f"Host {url} is not available")
        return None

if __name__ == "__main__":
    print(check_service("https://google.com"))