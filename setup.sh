#!bin/bash

# Delete And Kill Currently Working Processes

tput bold; echo "----------------Deleting currently working processes----------------"
minikube delete
killall -TERM kubectl minikube VBoxHeadless


tput bold; echo "--------------------------Starting Minikube-------------------------"
minikube start --driver=virtualbox
eval $(minikube docker-env)


# Build Docker Images

echo "${GREEN}Start building images${END}"
tput bold; echo "--------------------------Building WORDPRESS-------------------------"
docker build -t wordpress-image srcs/wordpress
tput bold; echo "--------------------------Building NGINX-----------------------------"
docker build -t nginx-image srcs/nginx
tput bold; echo "--------------------------Building PHPMYADMIN------------------------"
docker build -t phpmyadmin-image srcs/phpmyadmin
tput bold; echo "--------------------------Building MYSQL-----------------------------"
docker build -t mysql-image srcs/mysql
tput bold; echo "--------------------------Building FTPS------------------------------"
docker build -t ftps-image srcs/ftps
tput bold; echo "--------------------------Building GRAFANA---------------------------"
docker build -t grafana-image srcs/grafana
tput bold; echo "--------------------------Building INFLUXDB--------------------------"
docker build -t influxdb-image srcs/influxdb
echo "${BLUE}Docker build completed${END}"

# Set up Metallb
echo "${GREEN}Start setting up Deployments${END}"

tput bold; echo "--------------------------Setting up MetalLb-------------------------"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

tput bold; echo "--------------------------Feeding MetalLb.yaml to kubectl------------"
kubectl apply -f srcs/yaml/metalLb.yaml
tput bold; echo "--------------------------Feeding wordpress.yaml to kubectl------------"
kubectl apply -f srcs/yaml/wordpress
tput bold; echo "--------------------------Feeding nginx.yaml to kubectl------------"
kubectl apply -f srcs/yaml/nginx.yaml
tput bold; echo "--------------------------Feeding phpmyadmin.yaml to kubectl------------"
kubectl apply -f srcs/yaml/phpmyadmin.yaml
tput bold; echo "--------------------------Feeding sql.yaml to kubectl------------"
kubectl apply -f srcs/yaml/sql.yaml
tput bold; echo "--------------------------Feeding ftps.yaml to kubectl------------"
kubectl apply -f srcs/yaml/ftps.yaml
tput bold; echo "--------------------------Feeding grafana.yaml to kubectl------------"
kubectl apply -f srcs/yaml/grafana.yaml
tput bold; echo "--------------------------Feeding influxdb.yaml to kubectl------------"
kubectl apply -f srcs/yaml/influxdb.yaml

echo "${GREEN}Completed setting up Deployments${END}"

