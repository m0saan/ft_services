#!bin/bash

# Delete And Kill Currently Working Processes
minikube delete
killall -TERM kubectl minikube VBoxHeadless


# Start Minikube
minikube start --driver=docker

eval $(minikube docker-env)

# Set up Metallb

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"


# Build Docker Images

docker build -t i_wordpress srcs/wordpress
