#!/bin/bash

# if you are using docker swarm, please make sure the follow ip address is the master node
ssh -tt -p <%= sshPort %> <%= userName %>@<%= serverIP %> << EOF
docker login --username=<%= owner %> --password=<%= userPwd %> <%= repoZone %>

docker pull <%= repoZone %>/<%= repoNamespace %>/<%= mirrorName %>:<%= mirrorVersion %>

exit
EOF
