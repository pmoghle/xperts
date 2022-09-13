
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
          sh 'sudo docker  build -t flask -f ./Dockerfile.txt .'         


        }
       }
	  }
    stage('Deploy Image in to nexus registry') {
      steps{
        script {
	  sh 'sudo docker tag pooja 65.2.29.89:8083/repository/docker-grp/pooja'
	  sh 'sudo docker login -u admin -p pooja 65.2.29.89:8083/repository/docker-grp/' 
          sh 'sudo docker push 65.2.29.89:8083/repository/docker-grp/flask-app:2.0'
          sh 'sudo docker logout 65.2.29.89:8083/repository/docker-grp/'
          // sh 'curl -XGET "admin:pooja" -X PUT http://3.110.86.199:8081/repository/python/flask-app '
	    }
          }
        }
      }
    }
