#!/bin/bash
export CATTLE_ACCESS_KEY=token-gxrh5
export CATTLE_SECRET_KEY=md4cpx5nxvgjpj878g9cj6qnx9d4jwg8vgd6xr8rcfcv44bcfg8jfz
export CATTLE_END_POINT=https://rancher.iii.k8s.csie.nuu.edu.tw/v3
export CATTLE_PROJECT=local:p-ww7hq

for i in {1..200}
do
  sleep 5s
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-nkkf5?action=run"
  sleep 1s
  
done
