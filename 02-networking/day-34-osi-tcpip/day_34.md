# Stage 01: Linux & Networking Fundamentals
## Day 34: OSI vs TCP/IP

## Objective

Understand the OSI and TCP/IP models and map them to real Linux networking tools.

## Environment

Ubuntu Linux (local machine).

## Description

Studied the OSI 7-layer model and the TCP/IP model. Compared their structure and understood how they relate to real-world networking.

Observed how different layers appear in practice using Linux commands.

## What Was Done

- inspected network interfaces and ip addresses
- analyzed open ports and listening services
- identified running services on specific ports
- stopped nginx process on port 80
- performed DNS lookup
- tested TCP connectivity to a remote host
- inspected HTTP response headers
- traced packet route to an external server

## Commands Used

`ip addr`
`ip route`
`ss -tulpn`
`dig example.com`
`nc -vz example.com 80`
`curl -i http://example.com`
`traceroute google.com`

## Verification

- confirmed IP addresses and interfaces
- verified open ports and services
- validated DNS resolution
- confirmed TCP connectivity
- received valid HTTP resource
- observed full network path (multiple hops)

## Key Concept

Network communication follows layered architecture:

DNS -> TCP -> TLS -> HTTP

Each layer has a specific responsibility and can be tested independently.

## Takeaways

- OSI is a conceptual model, TCP/IP is practical
- understanding layers helps troubleshoot network issues
- ports represent services at the transport layer
- DNS resolution is required before any connection
- reducing open ports improves security (attack surface)
