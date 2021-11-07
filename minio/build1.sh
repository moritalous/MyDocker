#/bin/sh

# docker run --security-opt seccomp=unconfined alpine
apk add go git
GO111MODULE=on GOOS=linux GOARCH=arm go install github.com/minio/minio@latest
#docker commit --change='ENTRYPOINT ["/root/go/bin/minio"]' --change='CMD ["server", "/data"]' --change='EXPOSE 9000' $(docker ps -lq) moritalous/minio
