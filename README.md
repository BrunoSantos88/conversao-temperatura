# Projeto conversão de temperatura

--------------------------------------------------------------------------------------------
Desafio 1
 Sobre o projeto
O projeto conversão de temperatura é um projeto desenvolvido em NodeJS. O projeto tem como objetivo ser um exemplo para a criação de ambiente com containers usando NodeJS.

### Observações do projeto
A aplicação é exposta usando a porta 8080

-ESPOSE 
docker run -d -p  8080:8080 temperatura:v1

-Comandos add
Docker build 
docker build -t temperatura:v1 src/.

-Docker tag
docker tag temperatura:v1 brunosantos88/conversaotemperatura:v1
-Docker Push
docker push brunosantos88/conversaotemperatura:v1
---------------------------------------------------------------------------------------
Desafio 2 </p>
Criado pasta src-v2
Criando cluster EKS AWS 3 nó.
kubectl create namespace devopselite
kubectl apply -f  deployment.yaml --namespace=devopselite
