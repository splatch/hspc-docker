# Version: 0.0.2

FROM ubuntu:14.04
MAINTAINER Salvador Rodriguez <salvador.rodriguez@utah.edu>

# Install packages
ENV REFRESHED_AT 2016-03-15
RUN apt-get update && \
    apt-get install -yq --no-install-recommends mysql-server-5.6 wget unzip software-properties-common pwgen ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

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

# MySQL scripts 
# reference auth
COPY files/mysql/reference-auth/mysql_database_tables.sql /
COPY files/mysql/reference-auth/mysql_users.sql /
COPY files/mysql/reference-auth/mysql_system_scopes.sql /
COPY files/mysql/reference-auth/mysql_clients.sql /
 
# reference-api-mysql
COPY files/mysql/reference-api-mysql/resource-server-client.sql /

# reference-messaging
COPY files/mysql/reference-messaging/messaging-client.sql /

# reference apps
COPY files/mysql/reference-apps/bp-centiles-client.sql /
COPY files/mysql/reference-apps/cartiac-risk-client.sql /
COPY files/mysql/reference-apps/diabetes-monograph-client.sql /
COPY files/mysql/reference-apps/disease-monograph-client.sql /
COPY files/mysql/reference-apps/fhir-demo-client.sql /
COPY files/mysql/reference-apps/fhir-starter-client.sql /
COPY files/mysql/reference-apps/pediatric-growth-chart-client.sql /
COPY files/mysql/reference-apps/duke-pillbox-client.sql /
COPY files/mysql/reference-apps/clindat-client.sql /
COPY files/mysql/reference-apps/meducation-client.sql /

# bilirubin-chart
COPY files/mysql/bilirubin-chart/bilirubin-chart-client.sql /

# appointments
COPY files/mysql/appointments/appointments-client.sql /

# examples
COPY files/mysql/examples/test-clients.sql /

# patient data manager
COPY files/mysql/patient-data-manager/patient-data-manager-client.sql /

# sandbox-manager
COPY files/mysql/sandbox-manager/sandbox-manager-client.sql /

# setup mysql and run scrips
COPY files/img_scripts/config_mysql.sh /
COPY files/mysql/install-complete-ioc.sql /
RUN chmod 755 /config_mysql.sh
RUN sh config_mysql.sh
RUN rm config_mysql.sh
COPY files/mysql/my.cnf /etc/mysql/my.cnf
RUN rm -f *.sql

# Install TOMCAT
ENV TOMCAT_MAJOR_VERSION 8
ENV TOMCAT_MINOR_VERSION 8.0.11
ENV CATALINA_HOME /usr/local/tomcat

RUN wget -q http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz && \
    wget -qO- http://archive.apache.org/dist/tomcat/tomcat-${TOMCAT_MAJOR_VERSION}/v${TOMCAT_MINOR_VERSION}/bin/apache-tomcat-${TOMCAT_MINOR_VERSION}.tar.gz.md5 | md5sum -c - && \
    tar zxf apache-tomcat-*.tar.gz && \
    rm apache-tomcat-*.tar.gz && \
    mv apache-tomcat* ${CATALINA_HOME}

COPY files/tomcat/tomcat-users.xml ${CATALINA_HOME}/conf/tomcat-users.xml
COPY files/tomcat/setenv.sh ${CATALINA_HOME}/bin/setenv.sh

# Application deployments
# reference authentication 
COPY files/webapps/hspc-reference-authorization/hspc-reference-authorization.war /
RUN unzip hspc-reference-authorization.war -d ${CATALINA_HOME}/webapps/hspc-reference-authorization
RUN rm -f hspc-reference-authorization.war
COPY files/webapps/hspc-reference-authorization/auth.properties ${CATALINA_HOME}/webapps/hspc-reference-authorization/WEB-INF/classes/config/auth.properties

# reference api
COPY files/webapps/hspc-reference-api/hspc-reference-api.war /
RUN unzip hspc-reference-api.war -d ${CATALINA_HOME}/webapps/hspc-reference-api
RUN rm -f hspc-reference-api.war
COPY files/webapps/hspc-reference-api/application.yml ${CATALINA_HOME}/webapps/hspc-reference-api/WEB-INF/classes/application.yml	

# reference apps
COPY files/webapps/hspc-reference-apps/hspc-reference-apps.war /
RUN unzip hspc-reference-apps.war -d ${CATALINA_HOME}/webapps/hspc-reference-apps
RUN rm -f hspc-reference-apps.war
COPY files/webapps/hspc-reference-apps/apps.json ${CATALINA_HOME}/webapps/hspc-reference-apps/static/fhirStarter/apps.json
COPY files/webapps/hspc-reference-apps/services.js ${CATALINA_HOME}/webapps/hspc-reference-apps/static/fhirStarter/services.js
COPY files/webapps/hspc-reference-apps/user-apps.json ${CATALINA_HOME}/webapps/hspc-reference-apps/static/fhirStarter/user-apps.json

# bilirubin app
COPY files/webapps/hspc-bilirubin-app/hspc-bilirubin-app.war /
RUN unzip hspc-bilirubin-app.war -d ${CATALINA_HOME}/webapps/hspc-bilirubin-app
RUN rm -f hspc-bilirubin-app.war
COPY files/webapps/hspc-bilirubin-app/config.json ${CATALINA_HOME}/webapps/hspc-bilirubin-app/static/bilirubin-chart/config/config.json
COPY files/webapps/hspc-bilirubin-app/controllers.js ${CATALINA_HOME}/webapps/hspc-bilirubin-app/static/bilirubin-chart/js/controllers.js

# patient data manager
COPY files/webapps/hspc-patient-data-manager/hspc-patient-data-manager.war /
RUN unzip hspc-patient-data-manager.war -d ${CATALINA_HOME}/webapps/hspc-patient-data-manager
RUN rm -f hspc-patient-data-manager.war

# Add run script
COPY files/img_scripts/run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

EXPOSE 8080

CMD ["/usr/local/bin/run.sh"]

