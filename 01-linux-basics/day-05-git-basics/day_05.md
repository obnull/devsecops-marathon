# Stage 01: Linux & Git Basics
## Day 05: Git Basics + Global .gitignore

1. **Summary:**

- created `~/.gitignore_global` with patterns for secrets, IDE trash and logs.
- apply global git config: `git config --global core.excludesfile ~/.gitignore_global`
- tested in `day-05-git-basics`: file `.env` was ignored be `git status`
- commited `day_05.md` with message `feat(git): add day_05 for Git Basics`

2. **Folder contents:**

- `day_05`: day summary
- test `.env` file was remoted or never staged

### Result

Global `.gitignore` is a basic potection against accidental leacks. It should be set up on any machine used for development.
