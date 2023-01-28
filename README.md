# Projeto conversão de temperatura

-------------------------------------------------------------------------------------------------------------------------------------------------------------------
Desafio
Sobre o projeto
O projeto conversão de temperatura é um projeto desenvolvido em NodeJS. O projeto tem como objetivo ser um exemplo para a criação de ambiente com containers usando NodeJS.
### Observações do projeto
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
Commando add Kubectl </p>
kubectl create namespace devopselite  </p>
kubectl apply -f deployment.yaml --namespace=devopselite
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
