# devops
Ansible script with additional demo environment. Two containers are provided:
* `host` - clean Debian with ssh server
* `ansible` - additional controller which runs Ansible

After `host` boots, `ansible` executes installation playbook through predefined ssh credentials,
which are also provided.

## Prerequisites
You need to have `Docker` and `docker-compose` installed.

## Installation and running
```
git clone https://github.com/skycoin/devops
cd devops
docker-compose up
```
