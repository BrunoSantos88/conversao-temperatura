pipeline {
agent any

tools { 
///Depentencias 
maven 'Maven 3.6.3' 
terraform 'Terraform 1.3.7' 
}
environment {
//Chaves
AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
}

//Stages.
stages {   

stage('GIT CLONE') {
steps {
                // Get code from a GitHub repository
git url: 'https://github.com/BrunoSantos88/conversao-temperatura.git', branch: 'main',
credentialsId: 'aws-developer'
          }
}

stage('SONAR-SNYK(SAST)') {
            steps {		
				withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
					sh 'mvn snyk:test -fn'
				}
			}
    }


stage('Kubernetes Deployment(Services)') {
	steps {
	  withKubeConfig([credentialsId: 'kubelogin']) {
	sh ('kubectl apply -f clusterRole.yaml')
    sh ('kubectl apply -f config-map.yaml')
	sh ('kubectl apply -f prometheus-deployment.yaml')
	sh ('kubectl apply -f prometheus-service.yaml')
	
	}
	}
  }


  //Teste DAST para os serviçoes kuberntes
stage ('AGUARDAR OWSZAP(DAST)'){
	steps {
    sh 'pwd; sleep 180; echo "Application Has been deployed on K8S"'
	}
	}
	   

 stage('SONAR-OWSZAP(DAST)') {
  steps {
	  withKubeConfig([credentialsId: 'kubelogin']) {
	  sh('zap.sh -cmd -quickurl http://$(kubectl get services/web -o json| jq -r ".status.loadBalancer.ingress[] | .hostname") -quickprogress -quickout ${WORKSPACE}/zap_report.html')
	  archiveArtifacts artifacts: 'zap_report.html'
	}
	}
  } 

}
}
