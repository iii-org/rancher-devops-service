#!/bin/bash
export CATTLE_ACCESS_KEY=token-gxrh5
export CATTLE_SECRET_KEY=md4cpx5nxvgjpj878g9cj6qnx9d4jwg8vgd6xr8rcfcv44bcfg8jfz
export CATTLE_END_POINT=https://rancher.iii.k8s.csie.nuu.edu.tw/v3
export CATTLE_PROJECT=local:p-ww7hq

for i in {1..200}
do
  sleep 5s
  echo -n "root/pipeline-example-go-5"
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-nvpsr?action=run"
  #sleep 1s
  # root/pipeline-example-go-6
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-lkfvb?action=run" 
  #sleep 1s
  # root/pipeline-example-go-7
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-k4gkw?action=run"
  #sleep 1s
  # root/pipeline-example-go-8
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-sxbx9?action=run"
  #sleep 1s
  # root/pipeline-example-go-9
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-gdm8t?action=run"
  #sleep 1s
  # root/pipeline-example-go-10
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-4r9kx?action=run"
  #sleep 1s
  # root/pipeline-example-go-11
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-hs8n4?action=run"
  #sleep 1s
  # root/pipeline-example-go-12
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-62cgc?action=run"
  #sleep 1s
  # root/pipeline-example-go-13
  curl -k -u "${CATTLE_ACCESS_KEY}:${CATTLE_SECRET_KEY}" -X POST -H 'Accept: application/json' -H 'Content-Type: application/json' -d '{"branch":"master"}' "${CATTLE_END_POINT}/project/${CATTLE_PROJECT}/pipelines/p-ww7hq:p-7rzfh?action=run"
  #sleep 1s
  echo 'end one round'
done
