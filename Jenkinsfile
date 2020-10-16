pipeline {
    agent any 
    stages {
        stage('Build Nginx Image') {
            steps {
                docker build -t nginx-image . 
            }
        }
		stage('Deploy') {
            steps {
                docker run --name nginx-container -p 80:80 nginx-container 
            }
        }
    }
}