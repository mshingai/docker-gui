# Ubuntu Desktop Container

## Requirement
- Docker >= 18.09 (Build kit available)

## Build

```console
$ DOCKER_BUILDKIT=1 docker build -f ./Dockerfile --build-arg USER="developer" --build-arg TAG="20.04" -t ubuntudesktop .
```
TAG is selected from the tags of the [official ubuntu image](https://hub.docker.com/_/ubuntu?tab=tags).

## Usage

```console
$ xhost +local:
$ docker run --rm -it \
             --name ubuntu-desktop \
             --volume /tmp/.X11-unix/:/tmp/.X11-unix/ \
             --mount type=bind,source=$HOME/.Xauthority/,target=/home/developer/.Xauthority/ \
             --env DISPLAY=$DISPLAY \
             --env MESA_LOADER_DRIVER_OVERRIDE=i965 \
             --net host \
             ubuntudesktop
```