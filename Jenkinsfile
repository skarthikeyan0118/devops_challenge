pipeline {
    agent any 
    stages {
	stage('Kill previous running container') {
            steps {
               sh 'sudo docker kill $(sudo docker ps -q)'
	       sh 'sudo docker rm $(sudo docker ps -a -q)'
		    
            }
        }
        stage('Build Nginx Image') {
            steps {
               sh 'sudo docker build -t nginx-image .'
            }
        }
	stage('Deploy') {
            steps {
                sh 'sudo docker run -tid --name nginx-container -p 80:80 nginx-image'
            }
        }
    }
}
