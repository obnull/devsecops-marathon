#!/usr/bin/env python3
from concurrent.futures import ThreadPoolExecutor

def get_file_size(path):
    with open(path, 'r' ) as f:
        return len(f.read())
    

with ThreadPoolExecutor(max_workers=2) as executor:
    files = ['test_files/test1.txt', 'test_files/test2.txt', 'test_files/test3.txt']

    futures = []

    for file in files:
        future = executor.submit(get_file_size, file)
        futures.append(future)

    for future in futures:
        result = future.result()
        print(result)