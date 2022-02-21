pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    environment {
        // General Variables for Pipeline
//         PROJECT_ROOT = 'raiz del directorio'
//         EMAIL_ADDRESS = 'correo@gmail.com'
        REGISTRY = 'alancho01/docker-api-consultorios'
//         BUILD_NUMBER = 'Variable de entorno propia de jenkins'
    }
    stages {
        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
	stage("Clean"){
            steps {
                sh "./gradlew clean"
            }	
	}
        stage("Unit test") {
            steps {
		sh "./gradlew test"
            }
        }
        stage("Code coverage") {
            steps {
        	    sh "./gradlew jacocoTestReport"
        	 	publishHTML (target: [
         	        reportDir: 'build/reports/jacoco/test/html',
         			reportFiles: 'index.html',
         			reportName: 'JacocoReport'
         	    ])
         		sh "./gradlew jacocoTestCoverageVerification"
         	}
        }
        stage('SonarQube analysis') {
            steps {
                withSonarQubeEnv('SonarQubePruebas') {
                    sh './gradlew sonarqube'
                }
            }
        }
        stage('Build docker-image') {
        steps {
          sh "docker build -t ${REGISTRY}:${BUILD_NUMBER} ."
        }
      }
      stage('Deploy docker-image') {
        steps {
          // If the Dockerhub authentication stopped, do it again
          sh 'docker login'
          sh "docker push ${REGISTRY}:${BUILD_NUMBER}"
        }
      }

    }
}
