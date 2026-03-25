# Day 42 — SSH Key Authentication

## Objective

Configure SSH key-based authentication and disable password login.

## Environment

Linux (Ubuntu) host with SSH on custom port.

## Description

Replaced password authentication with SSH keys and validated secure access behavior.

## What Was Done

- generated SSH key pair
- added public key to server
- verified login via key
- disabled password authentication
- tested access without key

## Commands Used

`ssh-keygen`
`ssh-copy-id`
`ssh`
`sshd -T`

## Verification

- login works only with key
- no password prompt
- access denied without key

## Issues Encountered

Needed to verify behavior without cached credentials

## Key Concept

Private key proves identity; server trusts matching public key.

## Takeaways

- keys eliminate brute-force attacks
- private key must be protected
- passphrase adds security
- authentication is only one layer
