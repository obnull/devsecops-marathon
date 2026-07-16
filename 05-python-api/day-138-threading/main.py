import threading

numbers = [1, 2, 3]

def func(int):
    print(f"Working with {int}")

threads = []

for number in numbers:
    thread = threading.Thread(target=func, args=(number, ))
    threads.append(thread)

for thread in threads:
    thread.start()

for thread in threads:
    thread.join() 