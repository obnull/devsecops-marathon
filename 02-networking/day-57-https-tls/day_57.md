# Stage 01: Linux & Git Fundamentals
## Day 57 — HTTPS and TLS

## Objective

Understand HTTPS, TLS certificates, and how to inspect them. Learn why encryption matters and how to verify server identity.

## Environment

Ubuntu 24.04 LTS, curl, openssl.

## Description

Explored TLS protocol, certificate structure, and chain of trust. Compared HTTP vs HTTPS traffic. Inspected real certificates from google.com, github.com, yandex.ru. Learned why self-signed certificates fail and when to use curl -k.

## What Was Done

- Compared HTTP and HTTPS with curl -v
- Viewed certificate details with openssl x509 -text
- Extracted issuer, subject, and validity period from certificates
- Downloaded certificate to file and checked fingerprint
- Tested connection to self-signed.badssl.com with and without -k
- Checked TLS version support (1.2 and 1.3) for major sites

## Commands Used

`curl -v http://httpbin.org/get`
`curl -v https://httpbin.org/get`

`openssl s_client -connect google.com:443 -servername google.com 2>/dev/null | openssl x509 -text -noout | head -30`

`echo | openssl s_client -connect github.com:443 -servername github.com 2>/dev/null | openssl x509 > github-cert.pem`
`openssl x509 -in github-cert.pem -noout -fingerprint`
`openssl x509 -in github-cert.pem -text -noout | head -20`

`curl https://self-signed.badssl.com`
`curl -k https://self-signed.badssl.com`

`openssl s_client -connect google.com:443 -tls1_2 2>&1 | grep -i "handshake"`
`openssl s_client -connect google.com:443 -tls1_3 2>&1 | grep -i "handshake"`

## Verification

- HTTPS shows SSL/TLS handshake block in curl -v output
- Certificates contain subject (who owns), issuer (who signed), validity dates
- Self-signed certificates cause error 60: SSL certificate problem
- curl -k bypasses verification (test environments only)
- Major sites support TLS 1.2 and 1.3

## Issues Encountered

None. All commands executed successfully.

## Key Concept

TLS provides encryption, authentication, and integrity. Certificate chain of trust relies on Certificate Authorities (CA). Browser trusts CA, CA trusts website. Self-signed certificates break this chain.

## Takeaways

- Always use HTTPS for anything with passwords or tokens
- Check certificate expiry dates — expired certs break sites
- Never use curl -k in production
- TLS 1.2+ only. TLS 1.0 and 1.1 are dead
- mTLS in K8s ensures both client and server verify each other