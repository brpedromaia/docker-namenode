#!/bin/bash

# Environment variables
: ${HADOOP_PREFIX:=/usr/local/hadoop}

# Init hadoop-env
$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
/bin/rm -rf /tmp/*.pid

# Get hostname
export HOST_NAMENODE=`hostname`
echo "Current Hostname: " $HOST_NAMENODE

# format namenode...need to check this
if [ ! -d /hdfs/volume1/name/current ]; then
	echo "Formatting namenode"
	$HADOOP_PREFIX/bin/hdfs namenode -format
else
	echo "It Appears this namenode is ready. Skipping format."
fi

# start namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start namenode

# start namenode
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start secondarynamenode




# Workaround for graceful shutdown. ..... 

  while [ "" == '' ]; do
    sleep 1
  done

