# bashutils-containers
Pre-made containers to make it easier to use and distribute shell scripts based on the advanced capabilities of  https://bitbucket.org/solidfire/bashutils

Github: https://github.com/cseelye/bashutils-containers  
Docker Hub: https://hub.docker.com/r/cseelye/bashutils-base

There are two containers available, light and full. Both containers have bash 4.3, bashutils, and supporting tools installed.
* The light container is based on Alpine 3.6 and has a subset of common tools installed. This will run most common scripts and is a very compact container (~20MB), but does not cover every single feature of bashutils.
* The full container is based on Ubuntu 16.04 and is a more familar environment for many plus has all of the tools needed by bashutils to run all of the features. It is a larger container image (~215MB)

On Docker Hub the images are tagged with the version of bashutils that the container includes:  
```bashutils-base:1.4.11``` (light version)  
```bashutils-base:1.4.11-full``` (full version)

The variables ```BASHUTILS```, ```BASHUTILS_HOME``` and ```BASHUTILS_VERSION``` are set in the environment of the container with the information about the version of bashutils available in the container. ```BASHUTILS_VERSION``` is also a build arg that you can override to select a particular version to build an image with - the version must be a valid tag from the bashutils bitbucket repo.

## Usage
You can run these images directly and they will drop into an interactive bash shell with bashutils loaded. If you do this with your home directory mounted as a volume, you can easily run/test your scripts before building a specific image for them.

When you are ready to containerize/distribute your script, the easiest way is to use one of these images as a base, and add any additional tools and your script into the image.
```
FROM cseelye/bashutils-base:1.4.11
RUN apk update && apk add morepackages
COPY myscript.sh /root/myscript.sh
ENTRYPOINT ["/root/myscript.sh"]
```
