# Stage 01: Linux & Git Basics
## Day 19: Docker Resource Limits (CPU, RAM)

**Description:**

Explored how to limit CPU and memory usage fro Docker containers. Simulated memory exhaustion to trigger OOM Killer, tested CPU limits with `stress-ng`, and applied the same limits in `docker-compose.yaml`.

**What was done:**

- Limited container memory with `--memory="150M"` and tested vith `stress --vm 2 --vm-bytes`

- Observed OOM Killer in action (process killed with signal 9, container exited with code 137)

- Limited CPU with `--cpus=0.5"` and generated load using `stress-ng --cpu 2`

- Verified that CPU usage stayed around 50% (half a core)

- Created a `docker-compose.yaml` with resource limits

- Stopped and removed all containers with `docker rm -f $(docker ps -aq)`

- Practiced a custom test: container with 150mb RAM and 0.3 CPU, verified with `docker stats`

**Investigation:**

- Understood that `stress` may not always trigger OOM; `stress-ng` is more reliable

- Learned that `docker stats` shows CPU usage as percentage of one core

- Realised why resource limits are essential in production (noisy neighbour problem, DoS prevention)

### Result

Able to control container resources effectively, interpret OOM ivents, and define limits in both CLI and Compose - a crucial skill for stability and security in shared environments