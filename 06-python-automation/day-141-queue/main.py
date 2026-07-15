#!/usr/bin/env python3
import queue

tasks = queue.Queue()

tasks.put(101)
tasks.put(102)
tasks.put(103)
tasks.put(104)
tasks.put(105)

first_task = tasks.get()
second_task = tasks.get()

print(f"First task: {first_task}")
print(f"Second task: {second_task}")

for task in tasks.queue:
    print(f"Remaining task: {task}")