#/bin/sh

export TINI_KILL_PROCESS_GROUP=1
export GGC_ROOT_PATH=/greengrass/v2
export PROVISION=false
export AWS_REGION=us-east-1
export THING_NAME=default_thing_name
export THING_GROUP_NAME=default_thing_group_name
export TES_ROLE_NAME=default_tes_role_name
export TES_ROLE_ALIAS_NAME=default_tes_role_alias_name
export COMPONENT_DEFAULT_USER=default_component_user
export DEPLOY_DEV_TOOLS=false
export INIT_CONFIG=default_init_config
export TRUSTED_PLUGIN=default_trusted_plugin_path
export THING_POLICY_NAME=default_thing_policy_name

apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.13/main python3~=3.8   # python3.8
# apk add --repository http://dl-cdn.alpinelinux.org/alpine/v3.10/main python3~=3.7   # python3.7

apk add tar unzip wget sudo procps which openjdk8-jre

wget -q https://raw.githubusercontent.com/aws-greengrass/aws-greengrass-docker/v2.4.0/greengrass-entrypoint.sh && \
mv greengrass-entrypoint.sh /greengrass-entrypoint.sh && \
chmod +x /greengrass-entrypoint.sh

wget -q https://d2s8p88vqu9w66.cloudfront.net/releases/greengrass-2.4.0.zip && \
mkdir -p /opt/greengrassv2 /greengrass/v2 && unzip greengrass-2.4.0.zip -d /opt/greengrassv2 && rm greengrass-2.4.0.zip

wget -q https://raw.githubusercontent.com/aws-greengrass/aws-greengrass-docker/v2.4.0/modify-sudoers.sh && \
mv modify-sudoers.sh /modify-sudoers.sh && \
chmod +x /modify-sudoers.sh && \
./modify-sudoers.sh
