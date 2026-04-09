# Stage 01: Linux & Network Fundamentals
## Day 55 — DNS Records A, AAAA, CNAME, MX

## Objective

Understand DNS record types, query them manually, and learn the difference between A, AAAA, CNAME, MX, NS, and TXT records.

## Environment

Ubuntu 24.04 LTS, `dig, nslookup, host.

## Description

Explored DNS records of real domains. Learned that A = IPv4, AAAA = IPv6, CNAME = alias, MX = mail routing, NS = authoritative servers, TXT (SPF) = email anti-spoofing. Practiced queries with `dig, compared tools.

## What Was Done

- Studied theory: A, AAAA, CNAME, MX, NS, TXT (SPF)
- Queried A/AAAA records for google.com, yandex.ru, github.com
- Found CNAME examples (www.github.com, docs.gitlab.com)
- Checked MX records for gmail.com, yandex.ru, outlook.com
- Created full DNS profile for netflix.com
- Compared `dig vs nslookup vs host
- Answered control questions about DNS behavior

## Commands Used

`dig google.com A +short`
`dig google.com AAAA +short`
`dig yandex.ru A +short`
`dig www.github.com CNAME +short`
`dig docs.gitlab.com CNAME +short`
`dig gmail.com MX +short`
`dig yandex.ru MX +short`
`dig netflix.com A +short`
`dig netflix.com AAAA +short`
`dig netflix.com NS +short`
`dig netflix.com MX +short`
`dig google.com TXT +short | grep spf`

## Verification

A records return IPv4 addresses

AAAA records return IPv6 addresses (not all domains have them)

CNAME cannot coexist with other record types

MX records have priority values (lower = higher priority)

NS records point to authoritative servers

SPF TXT records protect against email spoofing

## Issues Encountered

None. All queries executed successfully.

## Key Concept

DNS is a distributed key-value database. Different record types serve different purposes. The resolver finds records by following the chain from root NS → TLD NS → authoritative NS. CNAME cannot be placed at zone apex (root domain). SPF is the first line of email security.

## Takeaways

`dig +short` is the fastest way to get clean output

Not all domains support IPv6 (AAAA)

CNAME is for subdomains only, not for root domains

MX priority matters — lower number = try first

Always check NS to understand who controls the domain