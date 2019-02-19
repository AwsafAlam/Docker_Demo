# What is Dockerfile

A text file with instructions to build image
Automation of Docker Image Creation

## How to create Dockerfile

Step 1 : Create a file named Dockerfile

Step 2 : Add instructions in **Dockerfile**

Step 3 : Build dockerfile to create image `docker build -t myimage:1.0 .`

Step 4 : Run image to create container `docker run myimage` OR `docker run imageid`

## How to build image from Dockerfile

## Basic Commands

Docker instance is not started up by default. to start it up manualy use `sudo dockerd`

- `docker build`
- `docker build -t ImageName:Tag directoryOfDocekrfile .`
- `docker images`
- `docker run image`

### TIPS & TRICKS

FROM
RUN
CMD
