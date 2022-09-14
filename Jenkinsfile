
pipeline {
  environment {
    registry = "http://65.2.29.89:8083/repository/mvn/"
    registryCredential = "nexusrepo"
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
 	  stage('save_docker_image_as_Tar'){
              steps{
 	       script{
 	                sh '''docker save -o pooja:1.0-$BUILD_NUMBER.tar pooja:1.0
                         sleep 0.05
                         docker rmi pooja:1.0 -f
                         chmod 775 pooja:1.0-"$BUILD_NUMBER".tar'''
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
          // sh 'curl  -u "admin:pooja" -XPUT http://65.2.29.89:8081/repository/mvn/pooja:1.0-"$BUILD_NUMBER".tar'
		docker.withRegistry('http://'+registry, registryCredential)
// 		docker.withRegistry(http://65.2.29.89:8083/repository/mvn/, registryCredential)
// 		dockerImage.push('1.0')
	    }
          }
        }
      }
    }
