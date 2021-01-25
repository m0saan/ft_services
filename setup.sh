#!bin/bash

# Delete And Kill Currently Working Processes
minikube delete
killall -TERM kubectl minikube VBoxHeadless


# Start Minikube
minikube start --driver=hyperkit

# Set up Metallb
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
kubectl apply -f srcs/yaml/metalLb.yaml

# Build Docker Images
docker build -t wordpress-image srcs/wordpress
docker build -t phpmyadmin-image srcs/phpmyadmin
docker build -t nginx-image srcs/nginx

eval $(minikube docker-env)
