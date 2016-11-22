# README
[toc]
## Assumptions
* This is for linux platform;
* Docker engine is already installed on the linux box, otherwise please go to [How to Install Docker](https://docs.docker.com/engine/installation/linux/) for installation instructions;
* You have ssh key pair in place, and the pub key is ~/.ssh/id_rsa.pub

## Start a Docker container running debian with SSHD
Open a terminal, and run below commands -

``` bash
docker run --name my-virgin-debian -d -p 2222:22 -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" krlmlr/debian-ssh
```
It will download the docker image, krlmlr/debian-ssh in our case, and start a container based on the image.  
**--name my-virgin-debian** : name the container as *my-virgin-debian*, it can be refer later with this name;  
**-d** : the container will run at background as daemon process;  
**-p 2222:22** : map the container's port *22* to host port *2222*, you can change 2222 to any arbitary ports;  
**-e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)"** : install the pub key at *~/.ssh/id_rsa.pub* to the container, so you could login with this pub key. The keys will be installed for user root.  
**krlmlr/debian-ssh** : this is the images already exists in docker hub.   
 
Now the debian container with SSHD is running, we can ssh into that container(server) by -

* ```ssh -p 2222 root@localhost``` To connect with user root

## About Docker tutorial
1. Personally I like the official tutorial the most, [Learn by example](https://docs.docker.com/engine/tutorials/). Once you completed this tutorial, you will have some general idea about docker and some basic commands to work with docker.
2. For more details about docker commands, just type **docker** in the console;
3. Then you may want to create your own docker images. This is about how to write your own dockerfile [Dockerfile reference](https://docs.docker.com/engine/reference/builder/).
4. Now you have all your modules dockerized, you want to start/manage them as one single application(with multiple modules, e.g. mysql, wordpress), you probably want to know [Docker Compose](https://docs.docker.com/compose/overview/)
5. At the meantime you can learn by reading others' dockerfile and docker compose files at [Docker Hub](https://hub.docker.com/)
6. Also on Docker hub, you may find that someone else has already created an image that meets your requirement. 

## Other questions
1. tell me how to list/find my docker images and the ports/IP addresses
	* to list images ```docker images```, or ```docker images|grep debian``` to search for certian images;
	* ```docker ps```, which list currently running containeres with ports redirects. e.g.
	
		```c457e433d206        krlmlr/debian-ssh      "/run.sh"           2 minutes ago       Up 2 minutes        0.0.0.0:2222->22/tcp                                          my-virgin-debian```  
	
	* To get its IP address ```docker inspect my-virgin-debian |grep IPAddress```. For most cases, we won't use it's ip address, it's just an IP in its virtual lan, which could not be reached by external parties. We have setup up port redirect on the host, we use that instead, e.g. to ssh to the container, we use ```ssh -p 2222 root@localhost```.
2. tell me how to add my public key from SSH so SSH login is automatic
	We've already added the pub key on chapter [Start a Docker container running debian with SSHD](#start-a-docker-container-running-debian-with-sshd)
3. tell me how to list the docker things running and shut them down
	* list all running containers ```docker ps```;
	* list all containers(including stopped) ```docker ps -a```;
	* stop a container ```docker stop name```;
	* delete a container ```docker rm -f name```.
4. Do I use docker-compose if I want a virgin docker image, every time I run server?
	*docker-compose* is for applications have multiple containers. You don't need docker-compose for this purpose.  
	If you want a virgin debian everytime, you just re-creating the container, so everything you have changed in the old container is gone.   
	
	```
	docker rm -f my-virgin-debian
	docker run --name my-virgin-debian -d -p 2222:22 -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" krlmlr/debian-ssh 
	```
	 