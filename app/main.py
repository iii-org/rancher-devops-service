#!/usr/bin/env python
# coding: utf-8

# ## 部屬(Flask) 產生pipeline的服務
# 
# 
# 參考資料
# * [flask-json](https://flask-json.readthedocs.io/en/latest/)

# In[ ]:


from datetime import datetime
from flask import Flask, request
from flask_json import FlaskJSON, JsonError, json_response, as_json

from lib_pipeline.rancher_pipeline import env_rancher_pipeline_generate, web_service_pipeline, db_service_pipeline

app = Flask(__name__)
FlaskJSON(app)


# #### 接受使用者要產生web專案的pipeline請求

# In[ ]:


@app.route('/pipeline/web', methods=['POST'])
def generate_web_pipeline():
    # 取得使用者傳入的資料
    data = request.get_json(force=True)
    print('user post data:{data}'.format(data=data))
    # 取出使用者個別的資料變數
    try:
        checkmarxEnabled = data['checkmarx']['enabled']
        checkmarxVersion = data['checkmarx']['version']
        newmanEnabled = data['newman']['enabled']
        webType = data['web']['type']
    except (KeyError, TypeError, ValueError):
        raise JsonError(description='Invalid value.')
    web_pipeline_template = web_service_pipeline(checkmarxEnabled, checkmarxVersion, newmanEnabled, webType)
    return web_pipeline_template


# #### 接受使用者要產生db專案的pipeline請求

# In[ ]:


@app.route('/pipeline/db', methods=['POST'])
def generate_db_pipeline():
    # 傳入使用者的資料
    data = request.get_json(force=True)
    print('user post data:{data}'.format(data=data))
    # 取出使用者個別的資料變數
    try:
        db_name = data['db']['name']
        db_type = data['db']['type']
        db_username = data['db']['username']
        db_password = data['db']['password']
    except (KeyError, TypeError, ValueError):
        raise JsonError(description='Invalid value.')
    db_pipeline_template = db_service_pipeline(db_name, db_type, db_username, db_password)
    return db_pipeline_template


# In[ ]:


if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, port=80)


# In[ ]:




