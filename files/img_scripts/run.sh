#!/bin/bash

# run mysql
/etc/init.d/mysql start

# start tomcat
sh ${CATALINA_HOME}/bin/catalina.sh run


