# Stage 01: Linux & Networking Fundamentals
## Day 35: IP Addressing & Routing

## Objective

Understand how system send packets and how routing works in Linux.

## Environment

Linux (Ubuntu), Wi-Fi interface.

## Description

Learned how system using IP address and routing table for send packets.

Compared local network traffic and external traffic.

## What Was Done

- checked network interfaces and found active one
- found local IP address and subnet
- found default gateway
- used `ip route get` to see how system chooses path.
- tested local and external connections
- discovered second interface (amn0) used for internet (VPN)

## Commands Used

`ip addr`
`ip route`
`ip route get 8.8.8.8`
`ip route get 192.168.1.1`
`ping`

## Verification

- comfirmed local IP and interface
- confirmed local subnet (192.168.1.0/24)
- confirmed default gateway (192.168.1.1)
- saw that local traffic goes directly
- saw that external traffic goes through routing decision
- sat that VPN interface (amn0) is used for internet

## Key Concept

Routing table is a list of routes.

System cheks routing table and decides where to send packets.

If destination is in local networt - send directly.
If not - send to default gateway.

VPN changes routing table and redirects traffic.

## Takeaways

- IP address shows host in network
- subnet defines local network
- routing table controls traffic
- default gateway is used for external traffic
- lower metric = higher priority
- system can use multiple interfaces
- VPN changes routing behavior
