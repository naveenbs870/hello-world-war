#!/bin/bash

apt update -y
apt install default-jdk -y
apt-cache search tomcat
apt install tomcat9 tomcat9-admin -y
ufw allow from any to any port 9090 proto tcp

# change the port number from 8080 to 8090
sed -i 's/Connector port="8080"/Connector port="8090"/Ig' /etc/tomcat9/server.xml

# Inside tomcat-users.xml paste below commands and allign properly

sed -i '56 i <role rolename="admin-gui"/>' /etc/tomcat9/tomcat-users.xml

sed -i '57 i <role rolename="manager-gui"/>' /etc/tomcat9/tomcat-users.xml

sed -i '58 i <user username="tomcat" password="pass" roles="admin-gui,manager-gui"/>' /etc/tomcat9/tomcat-users.xml


# Restart tomcat

systemctl restart tomcat9
systemctl status tomcat9

# open sudoers file and paste the below after the root line 

sed -i '45 i jenkins ALL=(ALL) NOPASSWD:ALL' /etc/sudoers
sed -i '46 i jenkins ALL=(ALL) NOPASSWD: /var/lib/jenkins/workspace' /etc/sudoers
