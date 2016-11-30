# devops
Ansible script with additional demo environment. Two containers are provided:
* `host` - clean Debian with ssh server
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
