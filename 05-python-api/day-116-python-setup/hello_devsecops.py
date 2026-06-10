#!/usr/bin/env python3

"""
Day 116: Python Setup Verification
First script - checking environment and Python version.
"""

import sys
import platform

def main():
 print ("=" * 50)
 print ("DevSecOps Python Environment Check")
 print ("=" * 50)
 print(f"Python version : {sys.version}")
 print(f"Platform: {platform.platform}")
 print(f"Virtual env: {sys.prefix}")

if sys.prefix == sys.base_prefix:
 print("Warning: not running in virtual environment!")
else: 
 print ("Virtual environment is running!")

 print ("=" * 50)

if __name__ == "__main__":
 main()