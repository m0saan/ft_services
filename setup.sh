#!bin/bash

# Colors
COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_YELLOW="$(tput setaf 3)"
COLOR_BLUE="$(tput setaf 4)"
    

# Text style
bold=$(tput bold)
normal=$(tput sgr0)

printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Deleting currently working processes--------${normal}" $COLOR_REST
minikube delete
killall -TERM kubectl minikube VBoxHeadless


printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Starting Minikube---------------------------${normal}"
minikube start --driver=virtualbox --memory=3072
eval $(minikube docker-env)

printf '%s%s%s\n' $COLOR_GREEN "${bold}-------------------Strating Minikube Dashboard-----------------${normal}" $COLOR_REST
minikube dashboard &
echo "Loading minikube dashboard\n"

# Build Docker Images
printf '%s%s%s\n' $COLOR_GREEN "${bold}------------------Start building images------------------------${normal}" $COLOR_REST && sleep 0.5

printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building WORDPRESS-------------------------" $COLOR_REST && sleep 0.5
docker build -t wordpress-image srcs/wordpress
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building NGINX-----------------------------" $COLOR_REST && sleep 0.5
docker build -t nginx-image srcs/nginx
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building PHPMYADMIN------------------------" $COLOR_REST && sleep 0.5
docker build -t phpmyadmin-image srcs/phpmyadmin
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building MYSQL-----------------------------" $COLOR_REST && sleep 0.5
docker build -t mysql-image srcs/mysql
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building FTPS------------------------------" $COLOR_REST && sleep 0.5
docker build -t ftps-image srcs/ftps
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building GRAFANA---------------------------" $COLOR_REST && sleep 0.5
docker build -t grafana-image srcs/grafana
printf '%s%s%s\n' $COLOR_BLUE "--------------------------Building INFLUXDB--------------------------" $COLOR_REST && sleep 0.5
docker build -t influxdb-image srcs/influxdb

printf '%s%s%s\n' $COLOR_YELLOW "${bold}----------------------------Images built completed-----------------------${normal}" $COLOR_REST

# Set up Metallb
printf '%s%s%s\n' $COLOR_GREEN "${bold}-----------------------------Start setting up Deployments-----------------${normal}" $COLOR_REST && sleep 0.5

printf '%s%s%s\n'  $COLOR_GREEN "${bold}-----------------------------Setting up MetalLb---------------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.3/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding MetalLb.yaml to kubectl-------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/metalLb.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding wordpress.yaml to kubectl-----------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/wordpress.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding nginx.yaml to kubectl---------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/nginx.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding phpmyadmin.yaml to kubectl----------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/phpmyadmin.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding sql.yaml to kubectl-----------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/sql.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding ftps.yaml to kubectl----------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/ftps.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding grafana.yaml to kubectl-------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/grafana.yaml
printf '%s%s%s\n' $COLOR_BLUE "${bold}--------------------------Feeding influxdb.yaml to kubectl------------------${normal}" $COLOR_REST && sleep 0.5
kubectl apply -f srcs/yaml/influxdb.yaml

printf '%s%s%s\n' $COLOR_YELLOW 'Completed setting up Deployments' $COLOR_REST
printf '%s%s\n' $COLOR_GREEN "DONE.\n"

