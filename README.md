# Docker_Demo

This repository is for practicing the basic functionalities of docker, and hosting in AWS

- Testing
- DevOps
- CI/CD
  
We need to nsure all the software components run on every platform. So we use docker.

Docker is a tool designed to make it easier to deploy and run applications by using containers.

Containers allow a developer to package up an application with all of the parts it needs, such as libraries and other dependencies and ship it all out as one package.

## A general workflow of docker

A developer will define all the application dependencies in a **docker file**.
This file can be used to make **docker image**. Docker containers run instances of docker images.

These images can be stored in an onlne cloud repository called [Docker Hub](https://hub.docker.com/). Docker Hub contains a list of public images, or you can store your own image. Images can also be stored in git.

These images can be pulled to create containers in any environment.

### Difference between virtualization and containerization

- **Virtialization**

In case of virtual machines, fixed memory must be allocated to each machine, so there is a lot of wastage of memory and space

- **Containerization**

Containers use the host operating system, unlike virtual instances. So, memory is not wasted. So there is no overhead.

### Understand docker client server architecture

Terminal acts as the client.  Docker Daemon acts as the server, which will have all the containers. Client and server together forms the Docker Engine.  Server receivescommands from the client via cli or rest api.

### Other Concepts

- Docker file
- Docker images
- Docker Containers
- Docker Hub / Registry
- Docker client
- Docker server / daemon
- Docker engine

Docker has a built in version control system. They work just like GIT repo, allowing to commit changes to Docker images and version control them.

Every app works in its own container and does not interfere with other applications working inseide other containers or on the host applicaton.

#### Docker Online

Try out [this demo](https://labs.play-with-docker.com/) to learn docker online.

---

### Installation

#### SET UP THE REPOSITORY

1. Update the `apt` package index:
`$ sudo apt-get update`

2. Install packages to allow `apt` to use a repository over HTTPS:

```shell
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

3. Add Docker’s official GPG key:

```shell
`$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -`
```

Verify that you now have the key with the fingerprint `9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88`, by searching for the last 8 characters of the fingerprint.

```shell
$ sudo apt-key fingerprint 0EBFCD8

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

4. Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.

```shell
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```

#### INSTALL DOCKER CE

- `$ sudo apt-get update`
- Install the latest version of Docker CE and containerd `$ sudo apt-get install docker-ce docker-ce-cli containerd.io`
- Verify that Docker CE is installed correctly by running the hello-world image. `$ sudo docker run hello-world`

```shell
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
1b930d010525: Pull complete
Digest: sha256:2557e3c07ed1e38f26e389462d03ed943586f744621577a99efb77324b0fe535
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
    (amd64)
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.

To try something more ambitious, you can run an Ubuntu container with:
 $ docker run -it ubuntu bash

Share images, automate workflows, and more with a free Docker ID:
 https://hub.docker.com/

For more examples and ideas, visit:
 https://docs.docker.com/get-started/
```

- Start Docker `sudo service docker start`
- Add usergroup to docker `sudo usermod -a -G docker awsaf`
- Get information about the docker image `sudo docker info`

```bash
Containers: 1
Running: 0
Paused: 0
Stopped: 1
Images: 1
Server Version: 18.09.2
Storage Driver: overlay2
 Backing Filesystem: extfs
 Supports d_type: true
 Native Overlay Diff: true
Logging Driver: json-file
Cgroup Driver: cgroupfs
Plugins:
 Volume: local
 Network: bridge host macvlan null overlay
 Log: awslogs fluentd gcplogs gelf journald json-file local logentries splunk syslog
Swarm: inactive
Runtimes: runc
Default Runtime: runc
Init Binary: docker-init
containerd version: 9754871865f7fe2f4e74d43e2fc7ccd237edcbce
runc version: 09c8266bf2fcf9519a651b04ae54c967b9ab86ec
init version: fec3683
Security Options:
 apparmor
 seccomp
  Profile: default
Kernel Version: 4.15.0-45-generic
Operating System: Ubuntu 18.04.1 LTS
OSType: linux
Architecture: x86_64
CPUs: 4
Total Memory: 11.63GiB
Name: awsaf-Inspiron-5437
ID: OTMQ:6NCA:OUXK:MTXE:SPQR:UDWQ:3ZPL:3QE5:NHYF:35L7:HWYD:VWHE
Docker Root Dir: /var/lib/docker
Debug Mode (client): false
Debug Mode (server): false
Registry: https://index.docker.io/v1/
Labels:
Experimental: false
Insecure Registries:
 127.0.0.0/8
Live Restore Enabled: false
Product License: Community Engine

WARNING: No swap limit support)
```

[Install Docker From binaries](https://docs.docker.com/install/linux/docker-ce/binaries/)

#### Uninstall old versions

`sudo apt-get remove docker docker-engine docker.io containerd runc`

---

### Docker Commands

- List all the images `sudo docker images`

```shell
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
hello-world         latest              fce289e99eb9        7 weeks ago         1.84kB

```

- List running containers `sudo docker ps`

```shell
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS              PORTS               NAMES

```

- List all containers `sudo docker ps -a`

```bash
CONTAINER ID        IMAGE               COMMAND             CREATED             STATUS                      PORTS               NAMES
3004002832c4        hello-world         "/hello"            35 minutes ago      Exited (0) 35 minutes ago                       unruffled_elion

```

- Run an image `sudo docker run hello-world`

If docker does not find the image locally, it will be pulled from docker hub

- Stop docker `sudo service docker stop`

[Other useful commands](https://get.docker.com/)

---