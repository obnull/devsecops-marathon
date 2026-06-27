#!/usr/bin/env python3

import requests
import logging

logging.basicConfig(
    level=logging.DEBUG,
    format='%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S')

TOKEN = "TOKEN"

headers = {
    "Authorization": f"Bearer {TOKEN}",
    "Accept": "application/json"
}

def get_repos(username):
    r = requests.get(f"https://api.github.com/users/{username}/repos")
    logging.info(f"Status: {r.status_code}")
    data = r.json()
    for item in data:
        print(item["name"], item["language"])
    return data

if __name__ == "__main__":
    get_repos("obnull")
