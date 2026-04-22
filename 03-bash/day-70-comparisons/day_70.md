# Stage 01: Linux & Networking Fundamentals
## Day 70: Comparison Operators

## Objective

Understand comparison operators in Bash: numeric (-eq, -ne, -gt, -lt, -ge, -le), strings (=, !=, -z) and file (-f, -d, -w, -s, -x, -e). Learn to correctly compare strings and numbers.

## Environment

OS: Ubuntu 24.04, Bash 5.x

## Description

Bash is loosely typed. The `>` operator works with strings, but numbers need `-gt`, `-eq` and others. An error in operator selection gives illogical results. Today I learned the correct operators for numbers, strings and files.

## What Was Done

Created 4 scripts:
- `number_compare.sh`: comparison of two numbers
- `range_check.sh`: range validation
- `file_properties.sh`: validation of file parameters
- `string_compare.sh`: comparison of two strings

## Commands Used

`[ $a -eq $b ]`                 # numbers are equal
`[ $a -gt $b ]`                 # a is greater than b
`[ $port -ge 1 ] && [ $port -le 1024 ]`  # range
`[ -f "$file" ]`                # check if it's a regular file
`[ -d "$dir" ]`                 # check if it's a directory
`[ -r "$file" ] && echo "readable"`  # short form
`[ "$str1" = "$str2" ]`         # strings are equal
`[ -z "$str" ]`                 # string is empty
`[ ! -e "$target" ]`            # file does NOT exist

## Verification

| Script | Input | Output |
| :--- | :--- | :--- |
| **number_compare.sh** | 5, 3 | 5 is greater than 3 |
| **number_compare.sh** | 10, 10 | 10 equals 10 |
| **range_check.sh** | 80 | Well-known port (1-1024) |
| **range_check.sh** | 8080 | Registered port (1025-49151) |
| **range_check.sh** | 60000 | Dynamic port (49152-65535) |
| **file_properties.sh** | /etc/passwd | Checking: /etc/passwd → Regular file, Readable |
| **file_properties.sh** | /tmp | Checking: /tmp → Directory, Writable |
| **string_compare.sh** | hello, hello | Strings are equal |
| **string_compare.sh** | "", world | First string is empty |

## Issues Encountered

None. All scripts worked as expected.

## Key Concept

Main rule: numbers compare with `-eq`, `-gt`, not via `>` or `=`. Always quote variables inside `[]` for scripts to work correctly.

## Takeaways

- `[ 5 -gt 20 ]` → false (correct), `[ 5 > 20 ]` → true (wrong, compares strings)
- Combined conditions: `[ $a -ge 1 ] && [ $a -le 100 ]`
- `-e` checks existence, `-f` and `-d` verify the type
- Always check for file existence before working with it