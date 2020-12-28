#!/bin/bash
for i in {1..200}
do
    echo "PULL IMAGE COUNER: $i"
    sudo docker pull 10.50.1.63:5443/hub/bitnami/wordpress
    sudo docker image rm 10.50.1.63:5443/hub/bitnami/wordpress
    sudo docker pull 10.50.1.63:5443/hub/tensorflow/tensorflow
    sudo docker image rm 10.50.1.63:5443/hub/tensorflow/tensorflow
done
