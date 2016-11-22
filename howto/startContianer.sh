#!/bin/sh

docker run --name my-virgin-debian -d -p 2222:22 -e SSH_KEY="$(cat ~/.ssh/id_rsa.pub)" krlmlr/debian-ssh

