# Stage 01: Linux & Networking Fundamentals
## Day 37: Ports & Sockets

## Objective

Understand how ports and socket works and learn how to identify listening services and active network connection.

## Environment

Linux (Ubuntu)

## Description

Learned how inspect to open ports and active connection using system tools. (Focus)

## What Was Done

- checkked listening ports on the system
- identified running services (ssh, nginx, dns)
- analyzed which ports are exposed to external network
- verified custom SSH port configuration
- checked active connection afted opening to web-site

## Commands Used

`ss -tulpn`
`ss -tpn`

## Verification

- confinmed nginx is listening on port 80 (0.0.0.0)
- confirmed SSH is running on custom port 3301
- confirmed DNS resolver works on localhost
- confirmed CUPS works only locally
- observed ESTABLISHED connections on external IPs over port 443

## Key Concept

Port is a number that identifies a service. Socket is combination IP address, port and protocol.
Socket is a combination of IP address, port and protocol.

LISTEN means servise is waiting for connection.
ESTABLISHED means active communication between client and server.

## Takeaways

- open ports defice attack surface
- services listening 0.0.0.0 are accessible externally
- localhost services are more secure
- active connections show real network activity
- one website can create multiple connections
