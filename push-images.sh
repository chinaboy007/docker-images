#!/bin/bash

for image in $(cat ./images.txt)
do
    myimage=$(echo $image | awk -F '/' '{print $NF}')
    docker pull $image

    # push到阿里云仓库
    #docker tag $imagepath registry.cn-hangzhou.aliyuncs.com/aliwill/$imagename
    #docker push registry.cn-hangzhou.aliyuncs.com/aliwill/$imagename

    # push到dockerhub
    docker tag $image chinaboy007/$myimage
    docker push chinaboy007/$myimage
done
