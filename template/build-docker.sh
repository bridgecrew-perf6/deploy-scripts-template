#!/bin/bash

# 1. build image
docker build -t <%= mirrorName %>:<%= mirrorVersion %> .

# 2. fetch image id
IMAGE_ID=$(docker image ls -q <%= mirrorName %>:<%= mirrorVersion %>)

# 3. use free container mirror service and login private repository，recommended:
#       - aliyun(https://help.aliyun.com/document_detail/257112.html?spm=5176.166170.J_5253785160.5.93cf5164mGxRDG)
#       - tencent(https://console.cloud.tencent.com/tcr)
docker login --owner=<%= owner %> --password=<%= userPwd %> <%= repoZone %>

docker tag $IMAGE_ID <%= repoZone %>/<%= repoNamespace %>/<%= mirrorName %>:<%= mirrorVersion %>

# 4. push to your private repository
docker push <%= repoZone %>/<%= repoNamespace %>/<%= mirrorName %>:<%= mirrorVersion %>
