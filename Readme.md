## Apache Hadoop 2.7.7 Docker images
**[See all here](https://hub.docker.com/r/brpedromaia/hadoop/)**
# Namenode docker image

***Note: This docker image requires *docker network running* and the following containers running: ***


# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t brpedromaia/hadoop-namenode:latest namenode/
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull brpedromaia/hadoop-namenode
```

# Start a container

***In order to use the Docker image you have just build or pulled use:***

```
docker create network dockerlan
docker run -itd --net=dockerlan --hostname=namenode --name=namenode brpedromaia/hadoop-namenode
```

***To enter in container***

```
docker exect -it namenode bash
```

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker create network dockerlan
docker run -it --net=dockerlan --hostname=namenode --name=namenode brpedromaia/hadoop-namenode -bash
```

** you would like to have a tunnel port exposed to localhost.**

```
docker run -itd --net=dockerlan --hostname=namenode -p 50070:50070 --name=namenode brpedromaia/hadoop-namenode
```

# Testing

You can in browser:

```
http://localhost:50070 
```


# Automate everything

To automate everything add code before "while" on namenode-entrypoint.sh 
