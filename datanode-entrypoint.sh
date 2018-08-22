#!/bin/bash

# Environment variables
: ${HADOOP_PREFIX:=/usr/local/hadoop}

# Init hadoop-env
$HADOOP_PREFIX/etc/hadoop/hadoop-env.sh
/bin/rm -rf /tmp/*.pid


# Start the datanode daemon
$HADOOP_PREFIX/sbin/hadoop-daemon.sh start datanode

# Start nodemanager
$HADOOP_PREFIX/sbin/yarn-daemon.sh start nodemanager


# Workaround for graceful shutdown. ..... 

  while [ "" == '' ]; do
    sleep 1
  done
