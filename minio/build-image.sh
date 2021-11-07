#/bin/sh

docker run -v $(pwd)/build1.sh:/build1.sh -v $(pwd)/bin:/root/go/bin --security-opt seccomp=unconfined alpine sh /build1.sh
#docker run -v $(pwd)/build2.sh:/build2.sh -v $(pwd)/bin:/tmp/bin     --security-opt seccomp=unconfined alpine sh /build2.sh

#docker commit --change='ENTRYPOINT ["/root/go/bin/minio"]' --change='CMD ["server", "/data"]' --change='EXPOSE 9000' $(docker ps -lq) moritalous/minio
