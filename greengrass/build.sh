#/bin/sh

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
