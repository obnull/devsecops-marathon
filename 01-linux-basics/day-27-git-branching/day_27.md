# Stage 01: Linux & Git Basics
## Day 27: Git Branching Fundamentals

## Objective

Understand how feature branches issolate development and enable safe collaboration in a repository.

## Description

Modern development workflows rarely allow direct commits to the `main` branch.
Instead, engineers create `feature branches` where changes are developed independently.

This approach provides:

- isolation of new work
- safer experimentation
- easier collaboration though
- protection on `main` branch

## What was done

1. Verified repository state using `git status`
2. Ensured `main` branch was clean and synchronized with `origin/main`
3. Create feature branch for the lab
4. Added a new files to simulate feature development
5. Commited the changes
6. Pushed the branch to the remote repository
7. Opened a Pull Request for review and merge

## Commands Used

Check repository state:

`git status`

Creater and switch to feature branch: 

`git switch -c feature/day-27-git-branching`

Staged new files:

`git add .`

Create a commit:

`git commit -m "feat(git): add day 27 branching lab"`

Push branch to remote and set upstream:

`git push -u origin feature/day-27-git-branching`

## Verification

Confirmed the current branch:

`git branch`

Verified repository state:

`git status`

Checked remote tracking branches:

`git branch -vv`

Reviewed commit history:

`git log --oneline --graph --all`

Opened a Pull Request on GitHub to merge the feature branch into `main`

## Key Concept

Feature branching allow developers to work independently without affecting the stable `main` branch.

Typical workflow:

main
  │
  └─ feature/day-27-git-branching
        │
        └─ commits
              │
              └─ Pull Request
                    │
                    └─ merge -> main

### Takeaways

- Feature branches isolate developers from the main codebase
- Pull requests provide a safe mechanism for reviewing and merging changes
- GitHub manages pull requests, while Git itself manages branches and commits
- A clean branching workflow improves collaboration and repository stability