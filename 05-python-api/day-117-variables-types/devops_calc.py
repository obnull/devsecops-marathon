#!/usr/bin/env python3

"""
Day 117: Working with Python types.
DevOps Calculator - memory, percentages, log parsing helpers.
"""

def calculate_memory_gb(bytes_value: int) -> float:
 """Convert bytes to gigabytes"""
 return round(bytes_value / (1024 ** 3), 2)

def calculate_uptime_percent(downtime_seconds: int, period_seconds: int) -> float:
 """Calculate uptime percentage for a given period."""
 uptime_seconds = period_seconds - downtime_seconds
 return round ((uptime_seconds / period_seconds) * 100, 4)

def parse_http_status_line(status_line: str) -> dict:
 """Parse a raw HTTP status line into components"""
 parts = status_line.split()
 return {
  "http_version": parts[0],
  "status_code": int(parts[1]),
  "reason": " ".join(parts[2:])
 }
 
def main():
 total_memory_bytes = 16_384_000_000
 status_ok = 200
 status_not_found = 404

 print("=" * 50)
 print("DEVOPS CALCULATOR")
 print("=" * 50)

 memory_gb = calculate_memory_gb(total_memory_bytes)
 print(f"Total memory: {memory_gb} GB")

 log_line = "HTTP/1.1 200 OK"
 parsed = parse_http_status_line(log_line)
 print(f"Parsed log: {parsed}")

 endpoint = "/api/users"
 response_time = 0.234
 print(f"GET {endpoint} -> {parsed['status_code']} ({response_time:.3f}s)")

 is_success = 200 <= parsed['status_code'] < 300
 is_client_error = 400 <= parsed['status_code'] < 500
 print(f"Success: {is_success}, Client Error: {is_client_error}")

 day_seconds = 86400
 downtime = 45
 uptime = calculate_uptime_percent(downtime, day_seconds)
 print(f"Uptime today: {uptime}%")
 print("=" * 50) 

if __name__ == "__main__":
 main()