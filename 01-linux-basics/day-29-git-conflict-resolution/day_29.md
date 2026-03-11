# Stage 01: Linux & Git Basics
## Day 29: Git Conflict Resolution

## Objective

The objective of this lab was to understand how Git detects merge conflicts and how they can be resolved manually during branch integration.

## Environment

The lab was performed on a Linux system using the Git command line interface inside the repository `devsecops-marathon`

## Description

A merge conflict occurs when two branches modify the same part part of a file and Git cannot automatically combine the changes.

In such situations Git stops the merge process and inserts conflict markers inside the affected file.
The developer must manually edit the file, choose the correct version, remote the conflict markers and complete the merge.

## What Was Done

A file named `conflict-demo.txt` was created the initial value:

version=1

A feature branch `feature/day-29-git-conflict-resolution` was created and the file was modified to:

version=2

After returning to the main branch, the same line was changed to:

version=production

When attempting to merge the feature branch into `main`, Git detected a conflict.

THe file was manually edited to resolve the conflict, leaving the final value:

version=production

The conflict markers were remoted and the merge was completed with a merge commit.

## Commands Used

git branch
git add
git commit 
git merge
git status
git log --oneline --graph --all

## Verification

The conflict was confirmed by the `git status` output showed *unmerged path*.

After resolving the conflict and commiting the changes the command `git log --oneline --graph --all` confirmed the presense of a merge commit integrating the feature branch into main.

## Key Concept

Merge conflicts occur when Git cannot automatically reconcile overlapping changes between branches.

Developers must manually resolve the conflict and finalize the merge.

## Takeaways

Understanding merge conflicts is essential for collaborative development workflows.

Manual conflict resolution ensures that the final code state reflects the intended changes before integration into the main branch.
