#!/usr/bin/env python3

import requests
import logging

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S'
)

TOKEN = "YOUR_TOKEN_HERE"

headers = {
    "Authorization": f"Bearer {TOKEN}",
    "Accept": "application/json"
}

def get_user_info():
    r = requests.get("https://api.github.com/user", headers=headers)
    logging.info(f"Status: {r.status_code}")
    return r.json()

if __name__ == "__main__":
    data = get_user_info()
    print(data)