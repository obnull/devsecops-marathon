# Stage 01: Linux & Networking Fundamentals
## Day 39: Host Network Audit

## Objective

Analyze the network exposure of the host system, identify open ports and services and assess potencial security risks.

## Environment

Linux (Ubuntu) host with containerized services.

## Description

Performed a network audit to verification purpose to listening services, open ports and processes and evaluate the system attacks surface.
Special attention was given to distinguishing between locally bound services and those exposed to the network.

## What Was Done

- identified network interfaces and IP configuration
- determined default gateway and network topology
- analyzed DNS configuration using local resolver
- enumerated listening ports and associated services using `ss`
- identified services exposed on all interfaces (0.0.0.0)
- observed dynamic port exposure caused by containerized workloads
- compared system state before and after stopping services

## Commands Used

`ip addr`
`ip route`
`hostname`
`cat /etc/resolv.conf`
`ss -tulpn`

## Verification

- host IP: 192.168.1.10/24
- default gateway: 192.168.1.1
- DNS handled via local resolver 127.0.0.53
- SSH service running on custom port 3301
- detected exposed services during runtime:
  - 5900/tcp - (remote access service)
  - 8006/tcp - (web interface)
  - 80/tcp - (web server)
- verified that stopping services reduced exposed ports and minimized attack surface

## Key Concept

Network exposure defends on service binding:

- 0.0.0.0 -> accessible from network
- 127.0.0.1 -> local-only access

Attack surface is dynamic and can change based on running services.

## Takeaways

- Containerized services can dynamically expose ports
- Binding services to all interfaces increases risk
- Network audits must consider runtime behavior
- Minimizing exposed services reduces attack surface
- Local-only access is prederred for administrative services
