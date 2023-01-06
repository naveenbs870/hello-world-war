pipeline {
    agent any
    stages {
	stage('Tomcat Installation') {
            steps {
// 		sh 'rm -rf hello-world-war'
//                 sh 'git clone https://github.com/naveenbs870/hello-world-war.git'
// 		sh 'pwd'
// 		dir ('hello-world-war') {
// 			sh 'tomcatscript.sh'
// 		}
		sh 'sudo apt update -y'
		sh 'sudo apt install default-jdk -y'
		sh 'sudo apt-cache search tomcat'
		sh 'sudo apt install tomcat9 tomcat9-admin -y'
		sh 'sudo ufw allow from any to any port 9090 proto tcp'
		sh 'sudo sed -i 's/Connector port="8080"/Connector port="8090"/Ig' /etc/tomcat9/server.xml'
		    
		sh 'sudo sed -i '56 i <role rolename="admin-gui"/>' /etc/tomcat9/tomcat-users.xml'

		sh 'sudo sed -i '57 i <role rolename="manager-gui"/>' /etc/tomcat9/tomcat-users.xml'

		sh 'sudo sed -i '58 i <user username="tomcat" password="pass" roles="admin-gui,manager-gui"/>' /etc/tomcat9/tomcat-users.xml'
		sh 'sudo systemctl restart tomcat9'
		sh 'sudo systemctl status tomcat9'
		sh 'sudo sed -i '45 i jenkins ALL=(ALL) NOPASSWD:ALL' /etc/sudoers'
		sh 'sudo sed -i '46 i jenkins ALL=(ALL) NOPASSWD: /var/lib/jenkins/workspace' /etc/sudoers'
            }
        }
	
	
        stage('Clone') {
            steps {
                sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/naveenbs870/hello-world-war.git'
            }
        }
        stage('Build') {
            steps {
                sh 'mvn package'
            }
        }
        stage('Deploy') {
             steps {
                 sh 'sudo cp ${WORKSPACE}/target/hello-world-war-1.0.0.war /var/lib/tomcat9/webapps'       
            }
        }
    }
}
