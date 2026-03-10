# Stage 01: Linux & Git Basics
## Day 28: Git Merge Strategies

## Objective

The objective of this lab was to understand how Git merges feature branches into main branch and how different merge strategies affect repository history 
Another goal was to observe how Pull Requests perform merges in collaboration workflows

## Environment

The lab was performed on a Linux system using the Git command line interface.
The repository was hosted on GitHub and synchronized with a remote origin.
All operations were executed inside the project repository named "devsecops-marathon".

## Description

In modern developed workflows, developers usually avoid commiting directly to the main branch.
Instead, new changes are implemented in separate feature branches.

This approach allows developers to work independently without affecting the stable version of the project.

When the work on a feature is completed, the branch is merged into the main branch.

Git supports several merge strategies.

A fast-forward merge simply moves the branch pointer forward when no divergence exists between branches.

A merge commit creates a special commit that combines the histories of two branches.

A squash merge compresses multiple commits from a feature branch into a single commit before integrating it into the main branch.

In collaborative environments, merges are typically performed through Pull Requests, which allow teams to review changes before they are integrated into the main branch.

## What Was Done

The repository state was first inspected to ensure that are working directory was clean and synchronized with the remote repository.

Next, the list of local branches was checked to confirm the presence of the feature branch created.

An attempt was made to merge the feature branch into the main branch.
Git reported that the branch was already up to date.

To investigate this situation, the commit history was analyzed using a graphical log view.

The history revealed that the feature branch had already been merged into the main branch though a Pull Request on GitHub.

Finally, the local feature branch was remoted as part of repository cleanuo after the merge process.

## Commands Used

`git status`
`git branch`
`git merge feature/day-27-git-branching`
`git log --oneline --graph --all`
`git branch -vv`
`git branch -d feature/day-27-git-branching`

## Verification

The merge status was verified by analyzing the commit history using a graphical representation of the repository.

The commit graph confirmed thet the feature branch had already been merged inso the main branch.

Branch tracking information showed that the local main branch remained synchronized with origin/main.

The repository cleanup was verified by confirming that only the main branch remained locally.

## Issues Encountered

No technical issues occured during the lab.

Whan attempting to merge the feature branch, Git reported that the repository was already up to date.

Further inspection revealed thet the feature branch had already been merged into the main branch through a Pull Reqest on GitHub.

## Key Concept

Feature branching isolates development work from the steble main branch.

Pull Requests provide a structured process for reviewing and merging changes.

Merge commits preserve the context and history of feature branches within the repository.


## Takesways

Feature branches allow developers to work independently without affecting the main codebase.

Pull Requests enable collaboration and code review before integration.

Merge commits maintain a clear record of how featurew were integrated into the project.

Cleaning up merged branches helps keep the repository organized and easier to maintain.