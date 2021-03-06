# containerception
A reference implementation of a self-referential [joke](https://xkcd.com/917/).

Because of reasons I wanted to toy with the following parts:
* [Alpine Linux](https://www.alpinelinux.org/)
* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)

So in a sense it was an obvious thing for me to put these three things together in a container.
Besides being an interesting thing to play with I'm not certain if this is useful at all.

Handing the docker socket to the container breaks isolation
and you need docker outside of the container to run it in the first place.
You could, however still use the resulting image as the basis for a container that manages
other containers by the means of `docker` and `docker-compose` in a spirit similar to what [skydock](https://github.com/crosbymichael/skydock) does.

## Using containerception:

* Adjust the `IMAGES` environment variable to contain a space separated list of base images
* Adjust the `SLEEPTIME` environment variable to contain a time parameter for the `sleep` command.
* Mount a folder with a `docker-compose.yml` to `/dockerception`
* Give the container access to the docker socket `/var/run/docker.sock`.

An example execution of `runjak/containerception` may look like this:
```
docker run \
  -e IMAGES="alpine:latest debian:sid" \
  -e SLEEPTIME="1d" \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v `pwd`:/containerception \
  -d runjak/containerception
```

## Remarks:

Sadly `runjak/containerception` cannot restart itself because `docker-compose up -d` kills the old container before a new one is up.
It appears that this would need the help of a second instance of `runjak/containerception`.
