#!/usr/bin/env python3

from dotenv import load_dotenv
import os
import logging
logging.basicConfig(
    level=logging.DEBUG,
    format = '%(asctime)s - %(levelname)s - %(message)s',
    datefmt='%Y-%m-%d %H:%M:%S')
import requests
required_var = ["ENDPOINTS"]

load_dotenv()

endpoints_raw = os.getenv("ENDPOINTS")
ENDPOINTS = endpoints_raw.split(",")

def check_endpoint(url):
    try:
        r = requests.get(url, timeout=5)
        if r.status_code == 200:
            logging.info(f"OK: {url}")
            return {"url": url, "status": r.status_code, "ok": True, "error": None}
        else:
            logging.warning(f"ALERT: {url} returned {r.status_code}")
            return {"url": url, "status": r.status_code, "ok": False, "error": None}
    except requests.exceptions.ConnectionError as e:
         logging.error(f"ALERT: {url} unreachable")
         return {"url": url, "status": None, "ok": False, "error": str(e)}
    except requests.exceptions.Timeout as e:
         logging.error(f"ALERT: {url} timed out")
         return {"url": url, "status": None, "ok": False, "error": str(e)}

def main():
    results = []
    for url in ENDPOINTS:
        result = check_endpoint(url)
        results.append(result)
    
    print("\n--- Health Check Report ---")
    for r in results:
        status = "✅ OK" if r["ok"] else "❌ ALERT"
        print(f"{status} {r['url']} (status: {r['status']})")

if __name__ == "__main__":
    main()