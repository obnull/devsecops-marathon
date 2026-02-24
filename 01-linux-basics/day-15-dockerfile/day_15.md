# Stage 01: Linux & Git Basics
## Day 15: Dockerfile - Building Custom Image

**Description**

Wrote with Dockerfile, built a custom image and run a container with a simple Python web app. Learned how layers work and how to optimize images. Explored ready-made images `nginx` and understood when not to oweride `CMD`

**What was done:**

- Created a simple Python web server (`app.py`) and an (`index.html`) page

- Wrote a Dockerfile using `FROM`, `LABEL`, `WORKDIR`, `COPY`, `CMD`

- Built an image with `docker build -t myapp:v1 .`

- Run a container and verified the app works on port 8000

- Exluded into the container to inspect files

- Modified the HTML, rebuild as `myapp:v2`, and run a second container

- Cleaned up containers and images

- Explored nginx image:
  - Found the correct path for static files (`/usr/share/nginx/html`)
  - Checked that `CMD` is already present `docker inspect`
  - Wrote a minimal Dockerfile for a static site (without extra `CMD` or `WORKDIR`)

- Answered questions about layer order

**Investigation:**

- Observed that changing `COPY` layer invalidates cache for subsequent layers

- Built a static nginx image from scratch

### Resut

Understand the full cycle of creating a custom docker image. Write -> build -> run -> modify -> rebuild -> clean. Know how to inspect base images and avoid common pitfalls (wrong path, extra `CMD`)
