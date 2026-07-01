#!/usr/bin/env python3

import re

def extract_ips(text):
    return re.findall(r"\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}", text)

def extract_urls(text):
    return re.findall(r"https?://\S+", text)
    
if __name__ == "__main__":
    text1 = "2026-06-30 14:12:10 ERROR connection from 192.168.1.105 failed"
    text2 = "Check https://google.com and http://github.com for details"
    result1 = extract_ips(text1)
    result2 = extract_urls(text2)
    print(result1)
    print(result2)