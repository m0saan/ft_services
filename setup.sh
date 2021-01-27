#!bin/bash

# Colors
COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_YELLOW="$(tput setaf 3)"
COLOR_BLUE="$(tput setaf 4)"
    

# Text style
bold=$(tput bold)
normal=$(tput sgr0)

printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Deleting currently working processes----------------${normal}" $COLOR_REST
minikube delete
killall -TERM kubectl minikube VBoxHeadless


printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Starting Minikube-----------------------------------${normal}"
minikube start --driver=hyperkit
eval $(minikube docker-env)

printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Strating Minikube Dashboard-------------------------${normal}" $COLOR_REST
minikube dashboard &


# Build Docker Images
printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Start building images------------------------${normal}" $COLOR_REST

printf '%s%s%s\n' $COLOR_BLUE "---------------------------Building WORDPRESS-------------------------" $COLOR_REST
docker build -t wordpress-image srcs/wordpress
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building NGINX-----------------------------" $COLOR_REST
docker build -t nginx-image srcs/nginx
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building PHPMYADMIN------------------------" $COLOR_REST
docker build -t phpmyadmin-image srcs/phpmyadmin
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building MYSQL-----------------------------" $COLOR_REST
docker build -t mysql-image srcs/mysql
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building FTPS------------------------------" $COLOR_REST
docker build -t ftps-image srcs/ftps
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building GRAFANA---------------------------" $COLOR_REST
docker build -t grafana-image srcs/grafana
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building INFLUXDB--------------------------" $COLOR_REST
docker build -t influxdb-image srcs/influxdb

printf $COLOR_YELLOW '------------------------------------Docker build completed---------------------' $COLOR_REST

# Set up Metallb
printf $COLOR_GREEN 'Start setting up Deployments' $COLOR_REST

echo "${bold}--------------------------Setting up MetalLb-------------------------${normal}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "${bold}--------------------------Feeding MetalLb.yaml to kubectl------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/metalLb.yaml
echo "${bold}--------------------------Feeding wordpress.yaml to kubectl-----------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/wordpress
echo "${bold}--------------------------Feeding nginx.yaml to kubectl---------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/nginx.yaml
echo "${bold}--------------------------Feeding phpmyadmin.yaml to kubectl----------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/phpmyadmin.yaml
echo "${bold}--------------------------Feeding sql.yaml to kubectl-----------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/sql.yaml
echo "${bold}--------------------------Feeding ftps.yaml to kubectl----------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/ftps.yaml
echo "${bold}--------------------------Feeding grafana.yaml to kubectl-------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/grafana.yaml
echo "${bold}--------------------------Feeding influxdb.yaml to kubectl------------${normal}" $COLOR_REST
kubectl apply -f srcs/yaml/influxdb.yaml

printf $COLOR_YELLOW 'Completed setting up Deployments' $COLOR_REST

