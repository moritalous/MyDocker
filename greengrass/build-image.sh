#/bin/sh

docker run -v $(pwd)/build.sh:/tmp/build.sh --security-opt seccomp=unconfined --dns=8.8.8.8 alpine sh /tmp/build.sh

docker commit --change='ENTRYPOINT ["/greengrass-entrypoint.sh"]' $(docker ps -lq) moritalous/greengrass-v2
