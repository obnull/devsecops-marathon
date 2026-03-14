# Stage 01: Linux & Git Basics
## Day 32: Git Hooks & Secret Detection

## Objective

Understand how Git hooks work and implement a basic security check that blocks commits containing potential secrets.

## Environment

- OS: Ubuntu Linux
- Shell: Zsh (Oh My Zsh)
- Git CLI
- Repository: `devsecops-marathon`

## Description

Git hooks allow automated checks before repository actions. The `pre-commit` hook was used to implement a basic security control that prevents committing sensitive information on environment configuration files.

## What Was Done

- Activated the `pre-commit` hook in `.git/hooks`
- Scanned staged files using `git diff --cached --name-only`
- Added checks to block:
  - `.env` files
  - patterns like `password=`, `token=`, `secret=`

## Commands Used

`git diff --cached --name-only`
`grep -qE "password=|token=|secret=|password:|token:|secret:"`
`git commit`

## Issues Encountered

Minor shell syntax errors were fixed during imolementation of the hook.

## Key Concept

Git hooks enable early security checks (shift-left security) by scanning code before it enters the repository.

## Takeaways

Local `pre-commit` hooks help prevent accidental secret leaks, but they should be combined with CI scanning because hooks can be bypassed using `git commit --no-verify`