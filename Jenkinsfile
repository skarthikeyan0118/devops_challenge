pipeline {
    agent any 
    stages {
	stage('Kill previous running container') {
            steps {
               sh 'sudo docker stop nginx-container|| true && docker rm nginx-container|| true'
	       
		    
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
