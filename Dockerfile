FROM centos:7
LABEL Pedro Maia Martins de Sousa <brpedromaia@gmail.com> and  Rodolfo Silva <Homaru> 

#######################################################
### Environment variables
#######################################################

ENV	HOME /root
ENV	LANG en_US.UTF-8
ENV	LC_ALL en_US.UTF-8

USER root

#######################################################
### Default Installation
#######################################################

RUN yum install -y which openssh-clients curl nc lzma

#######################################################
### Dev tools
#######################################################

#RUN yum install -y net-tools telnet mc git unzip

#######################################################
### Java Installation
#######################################################

ADD jdk-8u181-linux-x64.rpm /

RUN rpm -i jdk-8u181-linux-x64.rpm
RUN yum clean all
RUN rm -f /jdk-8u181-linux-x64.rpm

ENV JAVA_HOME /usr/java/default
ENV PATH $PATH:$JAVA_HOME/bin

#######################################################
### Hadoop Installation
#######################################################

RUN mkdir -p /usr/local
ADD hadoop.tar.gz /usr/local/

ENV HADOOP_HOME /usr/local/hadoop
ENV HADOOP_PREFIX /usr/local/hadoop
ENV HADOOP_COMMON_HOME /usr/local/hadoop
ENV HADOOP_HDFS_HOME /usr/local/hadoop
ENV HADOOP_MAPRED_HOME /usr/local/hadoop
ENV HADOOP_YARN_HOME /usr/local/hadoop
ENV HADOOP_CONF_DIR /usr/local/hadoop/etc/hadoop
ENV YARN_CONF_DIR $HADOOP_PREFIX/etc/hadoop
ENV PATH $PATH:/usr/local/hadoop/bin

RUN	rm -rf  $HADOOP_PREFIX/etc/hadoop/*.cmd && chmod +x $HADOOP_PREFIX/etc/hadoop/*.sh


#######################################################
### Expose Ports
#######################################################

EXPOSE 22 1527 9000 50070 50090

#######################################################
### Entrypoint 
#######################################################

COPY namenode-entrypoint.sh /entrypoint.sh
ENTRYPOINT  ["/entrypoint.sh"]


