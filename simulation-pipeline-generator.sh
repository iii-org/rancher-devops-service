echo '測試web專案部屬pipeline內容中'
curl --header "Content-Type: application/json" \
  --request POST \
  --data '{"username":"xyz","password":"xyz"}' \
  http://localhost:5000/pipeline/web
