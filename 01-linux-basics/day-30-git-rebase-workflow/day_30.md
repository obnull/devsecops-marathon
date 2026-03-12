# Stage 01: Linux & Git Basics
## Day 30: Git Rebase Workflow

## Objective

The obective of this lab was to understand how `git rebase` works and how it differs from a merge workflow.

## Environment

The lab was performed on a Linux system using the Git command line interface inside the repository `devsecops-marathon`

## Description

`Git rebase` is used to move commits from one branch on top of another branch.

Instead of creating a merge commit, Git reapplies the commits from the current branch on top of the latest commit from the target branch.

This results in a cleaner and linear history.

## What Was Done 

A feature branch `feature/day-30-git-rebase-workflow` was created from the `main` branch.

A file `rebase-demo.txt` was created with the ionitial value: 

version=1

The file was modified in the feature branch:

version=2

After switching to the `main` branch, the same file was created with another value:

version=production

The feature branch was then rebased onto `main`.

During the rebase process Git detected a conflict because the file had been added in both branches.

The conflict was resolved manually and the rebase process was continued.

## Commands Used

`git branch`
`git switch`
`git switch -c feature/day-30-git-rebase-workflow`
`git add`
`git commit`
`git rebase main`
`git status`
`git rebase --continue`
`git log --oneline --graph --all`

## Verification

The command

`git log --oneline --graph -all`

confirmed that the commits from the feature branch were replayed on top of the latest commit from `main`.

## Key Concept

`Git rebase` replays commits from the current branch ob top of another branch to create a linear commit history.

## Takeaways

Understanding rebase helps maintain a clean and readable Git history in collaborative development workflows.