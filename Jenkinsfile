
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
		sh "ls -lrth"
          	sh "docker  build -t pooja:1.0 ."         


        }
       }
	  }
    stage('Deploy Image in to nexus registry') {
      steps{
        script {
	  //sh "docker tag pooja:1.0 65.2.29.89:8083/repository/docker-grp/pooja:1.0"
	  //sh "docker login -u admin -p pooja 65.2.29.89:8083/repository/docker-grp/" 
          //sh " docker push 65.2.29.89:8083/repository/docker-grp/pooja:1.0"
          //sh "docker logout 65.2.29.89:8083/repository/docker-grp/"
           sh 'curl  -XPUT "admin:pooja" http://65.2.29.89:8081/repository/docker-grp/ '
	    }
          }
        }
      }
    }
