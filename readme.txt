
In order to build this image, you must include the following files in the files folder:

- hsp-api.war
- hsp-auth.war
- hsp-reference-apps.war

Build image :
sudo docker build -t="opencds/hspc:ubuntu" .
sudo docker build -t="hspc" .

Create container :
sudo docker run -d -p 8080:8080 -p 2222:22 --name hspc opencds/hspc:ubuntu

Test instaltion:
1.- Open a browser and go to: http://localhost:8080/hsp-reference-apps
2.- Log in with "demo/demo"
3.- Select a patient 
4.- Select an application


Find out the ipaddress of the container:
sudo docker inspect hspc | grep IPAddress

References:
https://healthservices.atlassian.net/wiki/display/HSPC/Download%2C+Build+and+Install+the+HSPC+Reference+Implementation

