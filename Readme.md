# Apache Hadoop 2.7.7 Datanode Docker image

_Note: This docker image requires *docker network running*.


# Build the image

If you'd like to try directly from the Dockerfile you can build the image as:

```
docker build  -t namenode:latest namenode/ .
```
# Pull the image

The image is also released as an official Docker image from Docker's automated build repository - you can always pull or refer the image when launching containers.

```
docker pull -----
```

# Start a container

In order to use the Docker image you have just build or pulled use:

```
docker run -itd --net=dockerlan --hostname=namenode --name=namenode namenode
```

**Make sure that SELinux is disabled on the host. If you are using boot2docker you don't need to do anything.**

```
docker run -it --net=dockerlan --hostname=namenode --name=namenode namenode -bash
```

** you would like to have a tunnel port exposed to localhost.**

```
docker run -it --net=dockerlan --hostname=namenode -p[$localPort]:[$dockerExposedPort] --name=namenode namenode
```

## Testing

You can run one of the stock examples:

```
#
```


## Automate everything

To automate everything add code before "# Start SSHD" on namenode-entrypoint.sh 