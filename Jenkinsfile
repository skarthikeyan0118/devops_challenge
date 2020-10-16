pipeline {
    agent any 
    stages {
        stage('Build Nginx Image') {
            steps {
               sh 'docker build -t nginx-image .'
            }
        }
	stage('Deploy') {
            steps {
                sh 'docker run --name nginx-container -p 80:80 nginx-container'
            }
        }
    }
}
