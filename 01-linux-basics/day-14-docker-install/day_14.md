# Stage 01: Linux & Git Basics
## Day 14: Docker - Installation & First Steps

**Description:**

Installed Docker engine, run first containers, explored basic commands and usnedstood container ephemerality. Connected nginx container th host port  and accessed it remotely.

**What was done:**

- Installed Focker Engine on Ubuntu (official repository)

- Added user to `docker` group to run commands without `sudo`

- Run `hello-word` to virify installation

- Pulled `nginx` image and run a container with port forwarding (`-p 8080:80`)

- Accessed `nginx` from browser (via server IP) and `curl`

- Executed into running container with `docker exec -it`

- Precticed cleanup: `stop`, `rm`, `rmi`

**Investigation tasks:**

- Created a file inside a Python container and confirmed it dissappears after exit
- Buind a ole-liner `docker run -d -p 8888:80 --name test-nginx nginx && docker logs test-nginx`

### Result

Understood the core Docker workflow: pull -> run -> exec -> stop -> clean. Learned that containers are ephemeral by default and data must have be store externally (volumes)
