# devops
Ansible script with additional demo environment. Two containers are provided:
* `host_debian` - clean Debian with ssh server, builds `skycoin`, `mzcoin`, `skycoin-exchange` and wallet apps.
* `host_alpine` - clean Alpine with ssh server, builds `skycoin` only.
* `ansible` - additional controller which runs Ansible

After `host` boots, `ansible` executes installation playbook through predefined ssh credentials,
which are also provided.

## Prerequisites
You need to have `Docker` and `docker-compose` installed:
```
sudo apt-get install docker.io
sudo apt-get install apparmor lxc cgroup-lite
sudo usermod -aG docker ${USER}
sudo docker -d
sudo pip install docker-compose
```

## Installation and running
```
git clone https://github.com/skycoin/devops
cd devops
docker-compose up
```

Build output for wallet can be found in `./release`.
Logs are available in `./logs`, separated for different hosts.

## Usage
### Stop cointainers
```
docker-compose stop
```
### Remove all containers
```
docker-compose rm
```
You can also add options to remove containers' volumes and make force remove:
```
docker-compose rm -fv
```

### Check logs
```
docker-compose logs
```

### Check running containers
```
docker ps
```

### Get interactive bash session for container
```
docker exec -it <container name> bash
```

You can also execute single commands without getting bash session:
```
docker exec <container name> <command> <arg1> <arg2> ...
```
