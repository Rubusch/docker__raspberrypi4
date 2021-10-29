[![CircleCI](https://circleci.com/gh/Rubusch/docker__raspberrypi4.svg?style=shield)](https://circleci.com/gh/Rubusch/docker__raspberrypi4)
[![License: GPL v3](https://img.shields.io/badge/License-GPL%20v3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0.html)

# Build Container for my RaspberryPi 4

Contains a Dockerfile for building an docker image and its container for the _RaspberryPi 4_ using buildroot.  

Implicitely will run ```git clone --branch lothar/raspberry4-devel https://github.com/Rubusch/buildroot.git``` inside the docker container.  


## Tools Needed

```
$ sudo apt-get install -y libffi-dev libssl-dev
$ sudo apt-get install -y python3-dev
$ sudo apt-get install -y python3 python3-pip
$ pip3 install docker-compose
```

Make sure, ``~/.local`` is within ``$PATH`` or re-link e.g. it to ``/usr/local``.  


## Build

```
$ ./setup.sh
```


## Usage

```
$ docker-compose -f ./docker-compose.yml run --rm rpi4_buildroot /bin/bash
```
