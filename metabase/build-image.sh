#/bin/sh

docker run -v $(pwd)/build.sh:/tmp/build.sh --dns=8.8.8.8 alpine sh /tmp/build.sh

docker commit --change='ENTRYPOINT ["/app/run_metabase.sh"]' --change='EXPOSE 3000' $(docker ps -lq) moritalous/metabase
