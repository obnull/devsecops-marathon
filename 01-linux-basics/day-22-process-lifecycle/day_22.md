# Stage 01: Linux & Git Basics
## Day 22: Process Lifecycle & Signal Management

**Description:**
Understand how Linux processed are created, managed, paused, terminated, and how improper handling can impact system stability and security

**What I Explored:**

### 1. Process Tree & Fork model
- Identidied my shell PID using `echo $$`
- Found parent with `ps -fp <PID>`
- Observed how `zsh` was spawned by `gnome-terminal-server`
- Confirmed that every command executed in shell creates a child process via `fork()`

Key concept:
There are no standalone processes. Every process has a parent (except PID 1)

### 2. Background Processes
- Started a background process using `sleep 300 &`
- Used `jobs` and `ps` to identify PID and PPID
- Confirmed shell as parent process

### 3. Signals (Process Control)
- Tested:
  - SIGSTOP -> paused process
  - SIGCONT -> resumed process
  - SIGTERM -> graceful termitation
  - SIGKILL (kill -9) -> forced termination

- Observed process state changes:
  - `T` = stopped
  - `S` = sleeping

Kye difference:
SIGTERM allows cleanup
SIGKILL immediately destroys the process

### 4. Zombie Process
- Created a C program that:
  - Forked a child
  - Child exited immediately
  - Parent did NOT call `wait()`
  - Parent slept

Result:
Child became a Zombie (`Z` state)

Important:
Zombie processes:
  - Do not use CPU
  - Do not use memory
  - But occupy a PID slot in the process table

**Security Lens:**

### Risks Identified
- Importer signal handling may corrupt data
- Useng `kill -9` in production may break integrity
- Uncontrolled child processes may create zombie
- Zombie accumulation may cause resource exhaustion
- Process table exhaustion can lead to Denial of Service (DoS)

## Final Takeaway

Linux is a process-based system.

Understanding:
- Fork model
- Signals
- Process States
- Parent-child relationships

Is critical for reliability and security.