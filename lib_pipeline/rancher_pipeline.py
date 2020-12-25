import yaml
import os

PIPELINE_TEMPLATE_FILE = './stander-rancher-pipeline.yaml'
## 部屬環境Config模擬
DEVOPS_REGISTRY = os.getenv('DEVOPS_REGISTRY', "XX.XX.XX.XX:XXXX")
REGISTRY_INSECURE = os.getenv('REGISTRY_INSECURE', "false")
GIT_HOST = os.getenv('GIT_HOST', "10.XX.XX.XX")

def env_rancher_pipeline_generate(PIPELINE_TEMPLATE_FILE, DEVOPS_REGISTRY, REGISTRY_INSECURE, GIT_HOST):
    # 讀取範例檔案 
    with open(PIPELINE_TEMPLATE_FILE, 'r') as stream:
        pipeline_template = yaml.load(stream, Loader=yaml.FullLoader)
    temp_pipeline_stages = pipeline_template['stages']
    # 修改第一階段 Publish User Web image
    temp_pipeline_stages[0]['steps'][0]['publishImageConfig']['registry'] = DEVOPS_REGISTRY
    temp_pipeline_stages[0]['steps'][0]['env']['PLUGIN_INSECURE'] = REGISTRY_INSECURE
    # 修改第三個階段 
    temp_pipeline_stages[2]['steps'][0]['applyAppConfig']['answers']['git.host'] = GIT_HOST
    return pipeline_template

def web_service_pipeline(checkmarxEnabled, checkmarxVersion, newmanEnabled, webType):
    global PIPELINE_TEMPLATE_FILE, DEVOPS_REGISTRY, REGISTRY_INSECURE, GIT_HOST
    pipeline_template = env_rancher_pipeline_generate(PIPELINE_TEMPLATE_FILE, DEVOPS_REGISTRY, REGISTRY_INSECURE, GIT_HOST)
    temp_pipeline_stages = pipeline_template['stages']
    # 把最後面的階段移除就會變成結果
    temp_pipeline_stages.pop(2)
    # 將使用者參數帶入
    app_web_answers = temp_pipeline_stages[1]['steps'][0]['applyAppConfig']['answers']
    app_web_answers['checkmarx.enabled'] = checkmarxEnabled
    app_web_answers['newman.enabled'] = newmanEnabled
    app_web_answers['web.type'] = webType
    return pipeline_template

def db_service_pipeline(db_name, db_type, db_username, db_password):
    global PIPELINE_TEMPLATE_FILE, DEVOPS_REGISTRY, REGISTRY_INSECURE, GIT_HOST
    pipeline_template = env_rancher_pipeline_generate(PIPELINE_TEMPLATE_FILE, DEVOPS_REGISTRY, REGISTRY_INSECURE, GIT_HOST)
    temp_pipeline_stages = pipeline_template['stages']
    # 把最前面的兩個階段移除
    temp_pipeline_stages.pop(0)
    temp_pipeline_stages.pop(0)
    # 將使用者參數帶入
    app_web_answers = temp_pipeline_stages[0]['steps'][0]['applyAppConfig']['answers']
    app_web_answers['db.name'] = db_name
    app_web_answers['db.type'] = db_type
    app_web_answers['db.username'] = db_username
    app_web_answers['db.password'] = db_password
    return pipeline_template