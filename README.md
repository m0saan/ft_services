# ft_services

## Description
* This is a System Administration and Networking project.

* Ft_services will introduce you to Kubernetes. You will discover cluster management and deployment with Kubernetes. You will virtualize a network and do "clustering".

### Components

- ```MetalLB```: Is a Load Balancer that manages external access to its services. It is the only entrance to the cluster.

- ```Nginx```: Is an HTTP and reverse proxy server, a mail proxy server, and a generic TCP/UDP proxy server.

- ```vsFTPd```: [very secure FTP daemon] Is an FTP server for Unix-like system, including Linux.

- ```MariaDB```: Is a database management system derived from MySQL with a GPL (General Public License).

- ```Wordpress```: Is a CMS(Content Managament System) focused on the creation of any type of web page.

- ```phpMyAdmin```: Is a free software tool intended to handle the administration of MySQL over the web.

- ```InfluxDB```: Is a open-source time series database developed by InfluxData

- ```Telegraf```: Is the open-source server agent to help you collect metrics from your stacks, sensors and systems.

- ```Grafana```: Is a open-source graphing and analisys software. Allows you to query, view, alert, and explore your metrics from Time Series Database Storage(TSDB)

### Technologies

- ```Docker```: Is a open-source project that automates the deployment of applications within software containers.

- ```Kubernetes```: Is an open-source system for automating the deployment, scaling, and handling of containerized applications.

- ```Minikube```: Is a Kubernetes utility that runs a Kubernetes cluster on your machine.

- ``` Kubectl```: is the command line application that lets you interact with your Minikube Kubernetes cluster.

- ```VirtualBox```: Is a generic tool for running virtual machines. It runs other operating systems—Ubuntu, Windows, etc.—inside your host operating system.

- ```Alpine Linux```: Is a Linux distribution based on musl and BusyBox, which aims to be lightweigth and secure by default.

## K8s

#### What Is k8s (Kubernetes):

Kubernetes is a container orchestration system—it automates the deployment and scaling of containers. Kubernetes' responsibility is to manage hundreds of containers across many computers. It takes control of their uptime, networking, storage,
and scheduling. When it needs to actually run a container, Kubernetes leaves that responsibility to the container runtime. The most popular container runtime is Docker, which is what we use in this book, but Kubernetes also supports other container runtimes like rkt and containerd.

#### Interacting with Kubernetes

To interact with a Kubernetes cluster, you use the command line tool kubectl. This program—which you install when you set up your development environment before using Kubernetes—makes requests to the Kubernetes cluster to manipulate the state of what's running on your cluster.


### Pods

A pod contains one or more containers, and all the containers in a pod are guaranteed to run on the same machine in the Kubernetes cluster. Containers in a pod share their networking infrastructure, their storage resources, and their lifecycle.

