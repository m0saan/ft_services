#!bin/bash

COLOR_REST="$(tput sgr0)"
COLOR_GREEN="$(tput setaf 2)"
COLOR_YELLOW="$(tput setaf 3)"
    

bold=$(tput bold)
normal=$(tput sgr0)

printf '%s%s%s\n' $COLOR_GREEN 'Start building images' $COLOR_REST
echo "${bold}----------------Deleting currently working processes----------------${normal}"

minikube delete
killall -TERM kubectl minikube VBoxHeadless


echo "${bold}----------------Starting Minikube-----------------------------------${normal}"
minikube start --driver=hyperkit
eval $(minikube docker-env)
minikube dashboard &


# Build Docker Images
printf '%s%s%s\n' $COLOR_GREEN 'Start building images' $COLOR_REST'
echo "${bold}--------------------------Building WORDPRESS-------------------------${normal}"
docker build -t wordpress-image srcs/wordpress
echo "${bold}--------------------------Building NGINX-----------------------------${normal}"
docker build -t nginx-image srcs/nginx
echo "${bold}--------------------------Building PHPMYADMIN------------------------${normal}"
docker build -t phpmyadmin-image srcs/phpmyadmin
echo "${bold}--------------------------Building MYSQL-----------------------------${normal}"
docker build -t mysql-image srcs/mysql
echo "${bold}--------------------------Building FTPS------------------------------${normal}"
docker build -t ftps-image srcs/ftps
echo "${bold}--------------------------Building GRAFANA---------------------------${normal}"
docker build -t grafana-image srcs/grafana
echo "${bold}--------------------------Building INFLUXDB--------------------------${normal}"
docker build -t influxdb-image srcs/influxdb
echo "${YELLOW}Docker build completed${END}"

# Set up Metallb
echo "${GREEN}Start setting up Deployments${END}"

echo "${bold}--------------------------Setting up MetalLb-------------------------${normal}"
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"

echo "${bold}--------------------------Feeding MetalLb.yaml to kubectl------------${normal}"
kubectl apply -f srcs/yaml/metalLb.yaml
echo "${bold}--------------------------Feeding wordpress.yaml to kubectl-----------${normal}"
kubectl apply -f srcs/yaml/wordpress
echo "${bold}--------------------------Feeding nginx.yaml to kubectl---------------${normal}"
kubectl apply -f srcs/yaml/nginx.yaml
echo "${bold}--------------------------Feeding phpmyadmin.yaml to kubectl----------${normal}"
kubectl apply -f srcs/yaml/phpmyadmin.yaml
echo "${bold}--------------------------Feeding sql.yaml to kubectl-----------------${normal}"
kubectl apply -f srcs/yaml/sql.yaml
echo "${bold}--------------------------Feeding ftps.yaml to kubectl----------------${normal}"
kubectl apply -f srcs/yaml/ftps.yaml
echo "${bold}--------------------------Feeding grafana.yaml to kubectl-------------${normal}"
kubectl apply -f srcs/yaml/grafana.yaml
echo "${bold}--------------------------Feeding influxdb.yaml to kubectl------------${normal}"
kubectl apply -f srcs/yaml/influxdb.yaml

echo "${YELLOW}Completed setting up Deployments${END}"

