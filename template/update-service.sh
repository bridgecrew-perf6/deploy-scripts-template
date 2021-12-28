#!/bin/bash

# if you are using docker swarm, please make sure the follow ip address is the master node
ssh -tt -p <%= sshPort %> <%= userName %>@<%= serverIP %> << EOF

docker service update --image <%= repoZone %>/<%= repoNamespace %>/<%= mirrorName %>:<%= mirrorVersion %> fujia-site_web
exit
EOF
