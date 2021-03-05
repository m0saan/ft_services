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

#### Labels
Kubernetes lets you associate key-value pairs to objects to help you identify and query them later. These key-value pairs are called labels.

#### Selectors
Selectors are the counterpart to labels that make labels useful. They are the mechanism for performing queries based on objects' labels. Selectors let you select a group of objects based on the key-value pairs that have been set as their labels.

- Labels and selectors have a functional purpose. Labels are key-value pairs set on an object. Selectors are queries that search for objects based on those key-value pairs. Because they're used in queries and sorting, labels need to be short and simple.

#### Annotations
Annotations are also key-value pairs, however annotations won't be indexed or queried on, and they’ll never be used to identify your objects.
- Annotations can store large amounts of data, potentially in a structured format.
- They are useful for storing version numbers, contributor lists, contact details, short release descriptions, links to logs and dashboards...

### Deployments
Deployments in Kubernetes let you manage a set of identical pods through a single parent object—the deployment.

### Services
Services let you define networking rules for pods based on their labels. Whenever a pod with a matching label appears in the Kubernetes cluster, the service will detect it and start using it to handle network requests made to the service.

###  Volume
A volume provides storage to your pod and the containers running inside it. The storage will live for as long as the pod lives—data will survive across container restarts but will be lost when the pod is destroyed. Further, this storage can be shared across containers, so if two containers are running in the same pod, they will be able to share files using the volume.
