# Stage 01: Linux & Git Basics
## Day 33: Git Team Workflow & Conflict Resolution

## Objective

Practice Git team workflow using feature branches and learn how to manually resolve merge conflicts.

## Environment

- OS: Ubuntu Linux
- Shell: Zsh
- Git CLI
- Repository: devsecops-marathon

## Description

This lab simulated a real team development workflow using Git.

Two feature branches were created and developed independently.
Both branches introduced changes to the repository and were later merged into the main branch.

A merge conflict was intentionally created in the README.md file to practice manual conflict resolution.

## What Was Done

- Created feature branch feature/system-monitor
- Implemented system monitoring script monitor.sh
- Pushed branch to remote repository
- Created second feature branch feature/log-check
- Implemented log analysis script log_check.sh
- Modified README.md in multiple branches
- Merged feature/system-monitor into main
- Triggered merge conflict when merging feature/log-check
- Manually resolved conflict in README.md
- Completed merge into main

## Commands Used

`git checkout -b feature/system-monitor`
`git add .`
`git commit -m "feat: add basic system monitoring script"`
`git push origin feature/system-monitor`

`git checkout main`
`git merge feature/system-monitor`

`git checkout -b feature/log-check`
`git add .`
`git commit -m "feat: add basic log check script"`
`git merge feature/log-check`

---

## Verification

Both scripts exist in the repository:

- monitor.sh
- log_check.sh

README.md contains changes from both branches.

Git history confirms successful merges and conflict resolution.

Example commit history:

    fac304a docs: add log analysis section
    620ed82 docs: add log analysis section
    5aa3502 Merge branch 'feature/system-monitor'
    96f00f3 docs: add system monitoring section
    61e11e0 feat: add basic log check script

## Issues Encountered

A merge conflict occurred in README.md because both branches modified the same section of the file.

Git inserted conflict markers:

    <<<<<<< HEAD
    content from main branch
    =======
    content from feature/log-check
    >>>>>>> feature/log-check

The conflict was resolved manually by reviewing both versions and combining the final content.

## Key Concept

Git merge conflicts occur when multiple branches modify the same part of a file.

The developer must manually review conflicting changes and decide how the final version should look.

## Takeaways

- Feature branches isolate development work.
- Git merges happen automatically when changes affect different files.
- Merge conflicts occur when branches modify the same part of a file.
- Conflicts must be resolved manually.
- Understanding Git history helps maintain a clean repository.