
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
          	sh "docker  build -t pooja  ."         


        }
       }
	  }
    stage('Deploy Image in to nexus registry') {
      steps{
        script {
	  //sh "docker tag pooja 65.2.29.89:8083/repository/docker-grp/pooja"
	  //sh "docker login -u admin -p pooja 65.2.29.89:8083/repository/docker-grp/" 
          //sh " docker push 65.2.29.89:8083/repository/docker-grp/pooja"
          //sh "docker logout 65.2.29.89:8083/repository/docker-grp/"
           sh 'curl -XGET "admin:pooja" -X PUT http://65.2.29.89:8081/repository/python/pooja '
	    }
          }
        }
      }
    }
