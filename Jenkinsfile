pipeline {
  agent any

  tools { 
        ///depentencias 
        maven 'Maven 3.6.3' 
        terraform 'Terraform 1.3.7' 
    }
        environment {
        //aws
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
        SNYK_TOKEN = credentials('SNYK_TOKEN')
    }


stages {   

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/conversao-temperatura.git', branch: 'main',
    credentialsId: 'devopselite'
          }
  }

  stage('snyk dependency scan') {
      steps {
        sh 'mvn snyk:test -fn'
      }
    }
  

  //Terraform
   stage('TF INICIAR') {
         steps {
           sh 'terraform init -reconfigure'
                
          }
     }

    stage('TF FMT') {
         steps {
              sh 'terraform fmt'
                
          }
       }

      stage('TF Apply') {
           steps {
        sh 'terraform apply -auto-approve'
           }
    }
        }

}
