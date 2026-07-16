#!/usr/bin/env python3

import threading
import queue

tasks = queue.Queue()

tasks.put(101)
tasks.put(102)
tasks.put(103)
tasks.put(104)
tasks.put(105)
tasks.put(None)
tasks.put(None)
tasks.put(None)

def worker():
    while True:
        task = tasks.get()
        if task is None:
            break       
        print(f"Processing task: {task}")

threads = []

for _ in range(3):
    thread = threading.Thread(target=worker)
    threads.append(thread)

for thread in threads:
    thread.start()

for thread in threads:
    thread.join()