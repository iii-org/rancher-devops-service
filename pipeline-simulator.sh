!/bin/bash

SECONDS=0

## 複製專案
mkdir test_repo
cd test_repo
git clone git clone http://10.50.1.53/root/flask-app-pipeline-template .
duration=$SECONDS
echo "copy repo: $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

## 登入private git registry
sudo docker login 10.50.1.63:5443 -u admin -p Harbor12345
## 刪除local image
sudo docker image rm 10.50.1.63:5443/china/uwsgi-nginx-flask:python3.8
sudo docker rm 10.50.1.63:5443/app/flask-app-pipeline-template-build

## 建立鏡像
SECONDS=0
sudo docker build -t 10.50.1.63:5443/app/flask-app-pipeline-template-build . --no-cache
duration=$SECONDS
echo "build image: $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
## 上傳鏡像
SECONDS=0
sudo docker push 10.50.1.63:5443/app/flask-app-pipeline-template-build:latest
duration=$SECONDS
echo "push image: $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."

#duration=$SECONDS
#echo "$(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
