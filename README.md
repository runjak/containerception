# dockerception
A reference implementation of a self-referential [joke](https://xkcd.com/917/).

Because of reasons I wanted to toy with the following parts:
* [Alpinelinux](https://www.alpinelinux.org/)
* [Docker Engine](https://docs.docker.com/engine/)
* [Docker Compose](https://docs.docker.com/compose/)

So in a sense it was an obvious thing for me to put these three things together in a container.
Besides being an interesting thing to play with I'm not certain if this is useful at all.

Handing the docker socket to the container breaks isolation
and you need docker outside of the container to run it in the first place.
You could, however still use the resulting image as the basis for a container that manages
other containers by the means of `docker` and `docker-compose` in a spirit similar to what [skydock](https://github.com/crosbymichael/skydock) does.
