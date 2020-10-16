pipeline {
    agent any 
    stages {
	stage('Kill previous running container') {
            steps {
               sh 'sudo docker stop nginx-container|| true && sudo docker rm nginx-container|| true'
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
	stage('Post deployment test') {
            steps {
               sh '''	
   			 httpcode=`curl -o /dev/null -s -w "%{http_code}\n" http://localhost`
			 if [ $httpcode -eq 200 ]; then
			 	echo -e "test passed. Deployment successful"
			 	exit 0
			 else
				echo -e "Deployment failed"
				exit 1
			 fi
		  '''
	    }
	}
    }
}
