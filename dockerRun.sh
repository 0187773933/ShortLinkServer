#!/bin/bash
APP_NAME="public-image-upload-server"
sudo docker rm -f $APP_NAME || echo ""
#sudo docker run -it $APP_NAME
id=$(sudo docker run -dit \
--name $APP_NAME \
--mount type=bind,source="$(pwd)"/config.json,target=/home/morphs/ShortLinkServer/config.json \
-p 7392:7392 \
$APP_NAME config.json)
sudo docker logs -f $id