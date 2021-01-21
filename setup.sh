#!bin/bash

eval $(minikube env default)

# Delete And Kill Currently Working Processes
minikube delete
killall -TERM kubectl minikube VBoxHeadless

# Start Minikube
minikube start --driver=docker

# Build Docker Images

docker build -t i_wordpress srcs/wordpress > tail -f dev/null/
