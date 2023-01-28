#Projeto conversão de temperatura
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
#Desafio 
Sobre o projeto
O projeto conversão de temperatura é um projeto desenvolvido em NodeJS. O projeto tem como objetivo ser um exemplo para a criação de ambiente com containers usando NodeJS. </p>
### Observações do projeto </p>
A aplicação é exposta usando a porta 8080
-ESPOSE 
docker run -d -p  8080:8080 temperatura:v1 
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Desafio 1 </p>
-Criado pasta src-v1 --- "referente ao projeto docker"  </p>
-Comandos add  </p>
-Docker build : 
docker build -t temperatura:v1 src/. </p>
-Docker tag :
docker tag temperatura:v1 brunosantos88/conversaotemperatura:v1 </p>
-Docker Push :
docker push brunosantos88/conversaotemperatura:v1
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Desafio 2 </p>
-Criado pasta src-v2 --- "referente ao projeto kubernetes"  </p>
-Criado cluster EKS AWS 3 nó. </p>
-Commando add Kubectl </p>
kubectl create namespace devopselite  </p>
kubectl apply -f deployment.yaml --namespace=devopselite
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Desafio 3 </p>
-Ambiente criado na aws   --- "projeto criando na pasta terraform ./projeto" </p>
-Criando cluster EKS com 3 nó  </p>
-main.tf com modulo projeto para executar a pasta ./projeto. </p>
-resource criandos eks.tf iam.tf node.tf networking.tf secutitygroup.tf </p>
-Cluster Eks e Node e suas permiçoes no IAM. Networking e IGW CIDR 172.0.0.0/16 e Subnets "172.0.1.0/24 172.0.2.0/24 172.0.3.0/24" </p>
-grupo de segurança com as portas necessarias 80 22 8080 5432 para EKS. Node Group esta default. </p>
-Vm com Jenkins com seu proprio grupo de Segurança com 22 8081 para somente para meu IP acessar. </p>
-Cluster EKS com acesso a porta 22 somente para o Jenkins Server acessar. </p>
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
