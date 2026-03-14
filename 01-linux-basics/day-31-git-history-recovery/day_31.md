# Stage 01: Linux & Git Basics
## Day 31: Git History Recovery

## Objective

Understand how Git can be recovered after destructive operations such as an incorrect hard reset.

## Environment

The lab was performed on a Linux system using the Git CLI inside repository `devsecops-marathon`.

## Description

Git keeps a history of reference movements through the `reflog` mechanism.

Even if commits disappear from the normal log afted operations like `git reset --hard`, they can still be located using `reflog`.

This allows developers to restore the repository to a previous state.

## What Was Done

A file `git-recovery-demo.txt` was created and modified through several commits:
- version=1
- version=2
- version=3
- version=stable

A destructive reset was performed to simulate accidental commit loss.

The command `git reflog` was used to locate the lost commit.

The repository was restored by resetting the branch to the revovered commit hash.

## Commands Used

`git log --oneline`
`git reset --hard HEAD~2`
`git reflog`
`git reset --hard 831a0cf`

## Verification

The commit history was restored and the file `git-recovery-demo.txt` returned to the expected value:
`version=stable`

## Key Concept

`git reflog` records movements of the HEAD reference and allows recovery of commits that are no longer visible in the standart Git log.

## Takeaways

Git history can often be recovered even after destructive operations. Understanding `reflog` is essential for safely managing repository history.