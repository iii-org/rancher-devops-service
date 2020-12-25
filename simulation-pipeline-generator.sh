#!/bin/bash
echo '測試web專案部屬pipeline內容中 錯誤的json資料模擬'
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"username":"xyz","password":"xyz"}' \
  http://localhost:9080/pipeline/web

echo '測試web專案部屬pipeline內容中 正確的json資料模擬'
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"checkmarx":{"enabled":true,"version":"latest"},"newman":{"enabled":false},"web":{"type":"php"}}' \
  http://localhost:9080/pipeline/web

echo '測試db專案部屬pipeline內容中 錯誤的json資料模擬'
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"username":"xyz","password":"xyz"}' \
  http://localhost:9080/pipeline/db

echo '測試db專案部屬pipeline內容中 正確的json資料模擬'
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"db":{"type":"mariadb","gui":true,"username":"bear","password":"bearisbear","name":"health"}}' \
  http://localhost:9080/pipeline/db
