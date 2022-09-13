
pipeline {
  environment {
    registry = "http://65.2.29.89:8083/repository/docker-grp/"
    registryCredential = 'nexusrepo'
    }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', url: 'https://github.com/pmoghle/xperts.git'
      }
    }
   stage('Building image') {
      steps{
        script {
          sh 'sudo docker build -t pooja -f ./Dockerfile.txt .' 

        }
       }
	  }
    stage('Deploy Image in to nexus registry') {
      steps{
        script {
	  sh 'sudo docker tag pooja 65.2.29.89:8083/repository/docker-grp/pooja'
	  sh 'sudo docker login -u admin -p pooja 3.110.86.199:8083/repository/docker-group/' 
          sh 'sudo docker push 3.110.86.199:8083/repository/docker-group/flask-app:2.0'
          sh 'sudo docker logout 3.110.86.199:8083/repository/docker-group/'
          // sh 'curl -XGET "admin:pooja" -X PUT http://3.110.86.199:8081/repository/python/flask-app '
	    }
          }
        }
      }
    }
