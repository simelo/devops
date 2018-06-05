# Skycoin DevOps

## Description

This is an ansible playbook built to make it easy to deploy a Skycoin
infrastructure. It uses Docker images and runs them on your servers with
little configuration.

## Setting up your environment

### Local

[Ansible](https://www.ansible.com/) is the only requirement on the host running this playbook. Please, read the project documentation for installation instructions.

### Remote

On the server side the playbook expects the following:

- A Debian GNU/Linux installed, Stretch preferably.
- SSH server with root access activated
- Python 2 installed

## Configure the playbook

The `hosts`file in the root of the project must be filled with the hosts you are going to install. There are two groups right now:

- `[skycoin-main]` Skycoin in master mode will  be installed on these hosts.
- `[skycoin]` Skycoin will be installed on these hosts.
- `[skycoin-explorer]` Skycoin, Skycoin-explorer and an nginx proxy will be installed on these hosts. You must define the `virtualhost` variable for every host, as it will be used to configure the web server virtualhost.

## Running the tasks

### Bootstrapping

With all the previously requirements met, you can run the following command:

`ansible-playbook -i hosts -k bootstrap.yml`

It will install sudo, disable the `root` user, add the `administrator` user with sudo privileges, install the ssh public key and configure the ssh server to only allow key authentication and deny access to `root`. This can only be run once, so is not idempotent.

### Installing and running Skycoin

After bootstrapping all the servers, installing Skycoin is really easy:

`ansible-playbook -i hosts main.yml`
