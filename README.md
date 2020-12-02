# Build Container for my RaspberryPi 4

Contains a Dockerfile for building an docker image and its container for the _RaspberryPi 4_ using buildroot.  

Implicitely will run ```git clone --branch lothar/raspberry4-devel https://github.com/Rubusch/buildroot.git``` inside the docker container.  


## Build


```
$ cd ./docker__buildroot/
$ time docker build --build-arg USER=$USER -t rubuschl/rpi4-buildroot:$(date +%Y%m%d%H%M%S) .
```

Use ```--no-cache``` for rebuild without artifacts.  


## Usage

Example tag _20191104161353_  

```
$ docker images
    REPOSITORY                      TAG                 IMAGE ID            CREATED             SIZE
    rubuschl/rpi4-buildroot         20191104161353      cbf4cb380168        24 minutes ago      10.5GB
    ...

$ docker run --rm -ti --user=$USER:$USER --workdir=/home/$USER -v $PWD/dl:/home/$USER/buildroot/dl -v $PWD/output:/home/$USER/buildroot/output rubuschl/rpi4-buildroot:20191104161353 /bin/bash

docker $> build.sh
```

Defaults to ``build.sh`` if called without ``/bin/bash``.  

