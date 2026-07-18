#!/usr/bin/env python3
from multiprocessing import Pool

def square(x):
    return x * x

with Pool(processes=2) as pool:
    result = pool.apply_async(square, args=(7,))
    print(result.get())

with Pool(processes=2) as pool:
    numbers = [1, 2, 3, 4, 5]
    result = pool.map(square, numbers)
    print(result)

with Pool(processes=2) as pool:
    numbers = [1, 2, 3, 4, 5]
    result = pool.map_async(square, numbers)
    print(result.get())

with Pool(processes=2) as pool:
    numbers = [1, 2, 3, 4, 5]
    result = pool.apply(square, args=(7,))
    print(result)