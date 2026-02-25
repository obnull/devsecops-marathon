# Stage 01: Linux & Git Basics
## Day 16:  Docker Compose - Container Orchestration

**Description:** 

Learned to manage multi-container applications with Docker Compose. Ran a web server and a database together, explored volumes, environment variables, and how to inspect running services.

**What was done:**

- Created `docker-compose.yaml` for a single nginx servise with a mounted volume (`./html:/usr/share/nginx/html`)

- Started the stack with `docker compose up -d` and verified with `curl`

- Vieved logs with `docker conpose logs`

- Executed into the running container (`docker compose exec web sh`) to confirm files were mounted correctly

- Stopped and removed containers with `docker compose down`

- Extended the compose file to add a `postgres` database:
  - Used environment variables (`POSTGRES_USER`, `POSTGRES_PASSWORD`, `POSTGRES_DB`)
  - Added named volume (`pgdata`) to persist database data

- Inspected volume with `docker volume ls` and `docker volume inspect`

- Created a separate compose fror nginx + redis to practice with an image that has no predefined environment variables

- Learned, how to check available environments variables on Docker Hub and when they are supported

**Investigation:**

- Compared `postgres` images (supported env vars) with redis (no env vars) and understood why the compose files differ

- Explored where volumes are stored on the host (`/var/lib/docker/volumes/...`)

- Cleaned up everything with `docker compose down -v`

### Result 

Able to write Docker Compose files for typical web + database stacks, understand the role of named volumes and know how to find configuration options in official image documestation
