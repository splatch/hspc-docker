In order to build this image, you must include the following files:

files/webapps/hspc-reference-api/hspc-reference-api.war
files/webapps/hspc-reference-apps/hspc-reference-apps.war
files/webapps/hspc-bilirubin-app/hspc-bilirubin-app.war
files/webapps/hspc-patient-data-manager/hspc-patient-data-manager.war
files/webapps/hspc-reference-authorization/hspc-reference-authorization.war
files/webapps/growth-chart-app/growth-chart-app.war
files/webapps/hspc-sandbox-manager/hspc-sandbox.manager.war

build image
sudo docker build -t="opencds/hspc" .

create volume for mysql data
sudo docker create -v /var/lib/mysql --name hspc-mysql-data opencds/hspc /bin/true

create volume for webapps
sudo docker create -v /usr/local/tomcat/webapps --name hspc-webapps opencds/hspc /bin/true

create container
sudo docker run --volumes-from hspc-webapps --volumes-from hspc-mysql-data --restart=always -d -p 8080:8080 --name hspc opencds/hspc

References:
https://healthservices.atlassian.net/wiki/display/HSPC/Platform+Developer's+Guide
