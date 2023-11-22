#!/bin/bash
APP_NAME="public-shork-link-server"
sudo docker rm -f $APP_NAME || echo ""
#sudo docker run -it $APP_NAME
id=$(sudo docker run -dit \
--name $APP_NAME \
--restart='always' \
-v $(pwd)/SAVE_FILES:/home/morphs/SAVE_FILES:rw \
--mount type=bind,source="$(pwd)"/config.json,target=/home/morphs/ShortLinkServer/config.json \
-p 7392:7392 \
$APP_NAME config.json)
sudo docker logs -f $id
