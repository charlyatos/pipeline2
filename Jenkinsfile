def qualityGateValidation(qg) {
  if (qg.status != 'OK') {
    emailext body: "WARNING: Code coverage is lower than 80% in Pipeline ${BUILD_NUMBER}", subject: 'Error Sonar Scan,   Quality Gate', to: "${EMAIL_ADDRESS}"
    return true
  }
  emailext body: "PIPELINE FINISHED: Code coverage is higher than 80%  in Pipeline ${BUILD_NUMBER} - SUCCESS", subject: 'Info - Correct Pipeline', to: "${EMAIL_ADDRESS}"
  return false
}
pipeline {
    agent any
    triggers {
        pollSCM('* * * * *')
    }
    environment {
        // General Variables for Pipeline
//         PROJECT_ROOT = 'raiz del directorio'
        EMAIL_ADDRESS = 'soymuygrandioso@gmail.com'
        REGISTRY = 'alancho01/docker-api-consultorios'
//         BUILD_NUMBER = 'Variable de entorno propia de jenkins'
    }
    stages {
        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        stage("Unit test") {
            steps {
		        sh "./gradlew test"
            }
            post{
                junit '**/build/test-results/test/TEST-com.alan.finalAPIconsultorios.controller.UserControllerTest.xml'

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
