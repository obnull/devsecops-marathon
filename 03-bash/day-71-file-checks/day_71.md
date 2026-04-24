# Stage 01: Linux & Networking Fundamentals
## Day 71: File and Directory Validation

## Objective

Learn all file operators: type check (-f, -d, -L), permissions (-r, -w, -x), owner (-O, -G), size (-s), time comparison (-nt, -ot).

## Environment

Ubuntu 22.04, Bash 5.x, ~/devsecops-marathon/03-bash/day-71-file-checks

## Description

Scripts without file checks break easily. Today: validate existence, permissions, ownership before any operation.

## What Was Done

5 scripts created:

1. **file_full_check.sh** — complete file check (type, permissions, owner, size)
2. **file_compare.sh** — compare modification time (-nt, -ot)
3. **safe_write.sh** — check directory before writing
4. **find_empty.sh** — find empty files in directory
5. **check_executable.sh** — verify command exists and is executable

## Commands Used

[ -f "$file" ]        # regular file
[ -d "$dir" ]         # directory
[ -L "$file" ]        # symlink
[ -s "$file" ]        # not empty
[ -r "$file" ]        # readable
[ -w "$file" ]        # writable
[ -x "$file" ]        # executable
[ -O "$file" ]        # owned by you
[ -G "$file" ]        # your group
[ "$f1" -nt "$f2" ]   # newer than
[ "$f1" -ot "$f2" ]   # older than

## Verification

| Script | Input | Output |
|--------|-------|--------|
| file_full_check.sh | /etc/passwd | Regular file, Readable, Not empty |
| file_full_check.sh | /tmp | Directory, Writable |
| file_compare.sh | file1.txt file2.txt | file2.txt is newer |
| safe_write.sh | - | Directory created, test.txt saved |
| find_empty.sh | /tmp | No empty files found |
| check_executable.sh | ls | Found /bin/ls, Executable |

## Issues Encountered

None. All scripts worked as expected.

## Key Concept

Always check before you act. `[ -e "$file" ]` before reading, `[ -w "$dir" ]` before writing, `[ -x "$cmd" ]` before executing.

## Takeaways

- Use `-e` for existence, then refine with `-f` or `-d`
- `-O` and `-G` help with permission debugging
- `-nt` / `-ot` useful for backup scripts
- `-s` catches empty files (often error logs)
- A defensive script checks everything before touching anything
