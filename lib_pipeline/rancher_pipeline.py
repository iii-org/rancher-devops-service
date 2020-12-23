import yaml

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