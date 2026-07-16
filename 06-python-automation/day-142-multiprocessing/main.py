#!/usr/bin/env python3
import multiprocessing

# def worker():
#     print("Hello from process")


# process = multiprocessing.Process(target=worker)
# process.start()
# process.join()

counter = 0

def worker():
    global counter
    counter = counter + 1
    print(f"Worker counter: {counter}")

if __name__ == "__main__":
    process = multiprocessing.Process(target=worker)
    process.start()
    process.join()
    print(f"Main counter: {counter}")