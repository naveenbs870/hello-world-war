pipeline {
    agent any
    stages {
	stage('Tomcat Installation') {
            steps {
		sh 'rm -rf hello-world-war'
                sh 'git clone https://github.com/naveenbs870/hello-world-war.git'
		sh 'pwd'
		dir ('hello-world-war') {
			sh tomcatscript.sh
		}
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
