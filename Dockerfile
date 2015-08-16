# Version: 0.0.1

FROM ubuntu:14.04
MAINTAINER Salvador Rodriguez <salvador.rodriguez@utah.edu>

# Install packages
ENV REFRESHED_AT 2015-08-14
RUN apt-get update && \
    apt-get install -yq --no-install-recommends mysql-server-5.6 maven wget unzip software-properties-common pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# ssh 
RUN apt-get update && apt-get install -y openssh-server
RUN mkdir /var/run/sshd
RUN echo 'root:screencast' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# SSH login fix. Otherwise user is kicked off after login
RUN sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd

ENV NOTVISIBLE "in users profile"
RUN echo "export VISIBLE=now" >> /etc/profile

# Install Java
RUN \
  echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java7-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk7-installer

# Set Java home
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle
RUN echo PATH=$JAVA_HOME/bin:$PATH:$HOME/bin >> ~/.bashrc
RUN echo export PATH JAVA_HOME >> ~/.bashrc

# Set maven home
RUN echo export M2_HOME=/usr/share/maven >> ~/.bashrc

# Install MySQL
ADD mysql_auth_install.sql /mysql_auth_install.sql
ADD mysql_clients.sql /mysql_clients.sql
ADD mysql_database_tables.sql /mysql_database_tables.sql
ADD mysql_system_scopes.sql /mysql_system_scopes.sql
ADD mysql_users.sql /mysql_users.sql
ADD config_mysql.sh /config_mysql.sh
RUN chmod 755 /config_mysql.sh
RUN /config_mysql.sh
RUN rm config_mysql.sh
ADD my.cnf /etc/mysql/my.cnf
RUN rm -f *.sql

# Install TOMCAT
ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11
ENV CATALINA_HOME /usr/local/tomcat

RUN wget -q https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- https://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

ADD tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
ADD setenv.sh ${CATALINA_HOME}/bin/setenv.sh

# Deploy hspc
ADD hsp-reference-apps.war /hsp-reference-apps.war
RUN unzip hsp-reference-apps.war -d ${CATALINA_HOME}/webapps/hsp-reference-apps
RUN rm -f hsp-reference-apps.war
ADD services.js ${CATALINA_HOME}/webapps/hsp-reference-apps/static/fhirStarter/services.js

# Installing open (unsecured) instance of hspc reference implementation does not require hsp-auth
#ADD hsp-auth.war /hsp-auth.war
#RUN unzip hsp-auth.war -d ${CATALINA_HOME}/webapps/hsp-auth
#ADD auth.properties ${CATALINA_HOME}/webapps/hsp-auth/WEB-INF/classes/config/auth.properties
#RUN rm -f hsp-auth.war

ADD hsp-api.war /hsp-api.war
RUN unzip hsp-api.war -d ${CATALINA_HOME}/webapps/hsp-api
ADD fhir-service-database-config-mysql.xml ${CATALINA_HOME}/webapps/hsp-api/WEB-INF/fhir-service-database-config-mysql.xml
ADD security-context.xml ${CATALINA_HOME}/webapps/hsp-api/WEB-INF/security-context.xml
RUN rm -f hsp-api.war

# Add image scripts
ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080
EXPOSE 22

CMD ["/usr/local/bin/run.sh"]

