#!/usr/bin/env python3
"""
Day 119: Conditional logic for HTTP status analysis.
Simulates checking multiple endpoints and making decisions.
"""

def classify_status(status_code: int) -> str:
    
    """Classify HTTP status code info category"""
    
    if not isinstance(status_code, int):
        return "    Error, status code must be integer"
    
    elif 100 <= status_code < 200:
        return "    Informational"
    
    elif 200 <= status_code < 300:
        return "    Success"
    
    elif 300 <= status_code < 400:
        return "    Redirect"
    
    elif 400 <= status_code < 500:
        return "    Client error"
    
    elif 500 <= status_code < 600:
        return "    Server error"
    
    else:
        return "    Unknown status code"
    

def should_alert(status_code: int, response_time: float) -> bool:
    
    """Determine if alert should be triggered."""

    if status_code >= 500 and response_time > 2.0:
        return True
    
    elif status_code >= 500:
        return True
    
    elif response_time >= 5.0:
        return True
    
    else:
        return False
    

def check_endpoint(url: str, status: int, response_time: float) -> dict:

    """Full endpoint check with recommendations."""

    result = {
        "url": url,
        "status": status,
        "response_time": response_time,
        "category": classify_status(status)
    }

    if status == 200 and response_time < 0.5:
        result["action"] = "  All good"

    elif status == 200 and response_time >= 0.5:
        result["action"] = "  Optimize: slow response"

    elif status in [301, 302]:
        result["action"] = "  Redirect — check if permanent"
    
    elif status == 401 or status == 403:
        result["action"] = "  Auth issue — check credentials"
    
    elif status == 404:
        result["action"] = "  Resource not found — check URL"
    
    elif status == 429:
        result["action"] = "  Rate limited — implement backoff"
    
    elif 500 <= status < 600:
        result["action"] = "  Server error — check logs immediately!"
    
    else:
        result["action"] = "  Unknown — manual investigation needed"

    result["alert"] = should_alert(status, response_time)

    return result


def main():
    endpoints = [
        ("/api/health", 200, 0.12),
        ("/api/users", 200, 1.8),
        ("/api/admin", 403, 0.05),
        ("/api/old-page", 301, 0.03),
        ("/api/missing", 404, 0.09),
        ("/api/payment", 500, 3.2),
        ("/api/login", 429, 0.15),
    ]

    print("=" * 60)
    print("HTTP Endpoint monitoring")
    print("=" * 60)

    alerts = []

    for url, status, resp_time in endpoints:
        result = check_endpoint(url, status, resp_time)

        alert_icon = "🚨" if result["alert"] else " "
        print(f"{alert_icon} {result['url']}")
        print(f"   Status: {result['status']} ({result['category']})")
        print(f"   Response: {result['response_time']}s")
        print(f"   Action {result['action']}")
        print()

        if result["alert"]:
            alerts.append(result)

        if alerts:
            print("=" * 60)
            print(f"   Alerts: {len(alerts)} issues detected!")
            for a in alerts:
                print(f"    {a['url']}: {a['action']}")
        else:
            print("   No alerts - all system healthy")
        
        print("=" * 60)


if __name__ == "__main__":
        main()