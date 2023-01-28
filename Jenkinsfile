pipeline{
  agent any

  tools { 
        ///depentencias 
        maven 'Maven 3.6.3' 
        terraform 'Terraform 1.3.7' 
}
        environment {
        //Chaves
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        DOCKERHUB_CREDENTIALS = credentials('dockerlogin')
}

 stages {   

stage('GIT CLONE') {
  steps {
                // Get code from a GitHub repository
    git url: 'https://github.com/BrunoSantos88/conversao-temperatura.git', branch: 'main',
    credentialsId: 'devopselite'
  }
  }


//TEST SAST 
stage('SynkSonar(SAST)') {
  steps {		
		withCredentials([string(credentialsId: 'SNYK_TOKEN', variable: 'SNYK_TOKEN')]) {
		sh 'mvn snyk:test -fn'
	}
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

//Docker 
stage('Docker Build') {
  steps {
    sh 'docker build -t brunosantos88/conversaotemperatura:v2 src-v2/.'
  }
  }

stage('Docker Login') {
  steps {
    sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
  }
  }
   
stage('Docker Push') {
  steps {
    sh 'docker push brunosantos88/conversaotemperatura:v2'
  }
  }
  
stage('Kubernetes Deployment(Services)') {
	steps {
	  withKubeConfig([credentialsId: 'kubelogin']) {
		sh ('kubectl apply -f deployment.yaml --namespace=devopselite')
    sh ('kubectl apply -f servicedb.yaml --namespace=devopselite')
	}
	}
  }

//Teste DAST para os serviçoes kuberntes
stage ('AGUARDAR OWSZAP(DAST)'){
	steps {
    sh 'pwd; sleep 180; echo "Application Has been deployed on K8S"'
	}
	}
	   

 stage('OWSZAPSONAR(DAST)') {
  steps {
	  withKubeConfig([credentialsId: 'kubelogin']) {
	  sh('zap.sh -cmd -quickurl http://$(kubectl get services/web --namespace=devopselite -o json| jq -r ".status.loadBalancer.ingress[] | .hostname") -quickprogress -quickout ${WORKSPACE}/zap_report.html')
    sh('zap.sh -cmd -quickurl http://$(kubectl get services/postgre --namespace=devopselite -o json| jq -r ".status.loadBalancer.ingress[] | .hostname") -quickprogress -quickout ${WORKSPACE}/zap_report.html')
	  archiveArtifacts artifacts: 'zap_report.html'
	}
	}
  } 

}
}
