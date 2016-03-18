In order to build this image, you must include the following files:

files/webapps/hspc-reference-api/hspc-reference-api.war
files/webapps/hspc-reference-apps/hspc-reference-apps.war
files/webapps/hspc-bilirubin-app/hspc-bilirubin-app.war
files/webapps/hspc-patient-data-manager/hspc-patient-data-manager.war
files/webapps/hspc-reference-authorization/hspc-reference-authorization.war

Build image:
sudo docker build -t="opencds/hspc" .

Create container:
sudo docker run -d -p 8080:8080 --name hspc opencds/hspc

References:
https://healthservices.atlassian.net/wiki/display/HSPC/Platform+Developer's+Guide