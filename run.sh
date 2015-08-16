#!/bin/bash

# run ssh 
/usr/sbin/sshd

# run mysql
/etc/init.d/mysql start

# start tomcat
sh ${CATALINA_HOME}/bin/catalina.sh run


