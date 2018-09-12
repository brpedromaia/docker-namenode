FROM brpedromaia/hadoop
LABEL Pedro Maia Martins de Sousa <brpedromaia@gmail.com> and  Rodolfo Silva <Homaru> 

#######################################################
### Expose Ports
#######################################################

EXPOSE 22 1527 9000 50070 50090

#######################################################
### Entrypoint 
#######################################################

COPY namenode-entrypoint.sh /namenode-entrypoint.sh
ENTRYPOINT  ["/namenode-entrypoint.sh"]


