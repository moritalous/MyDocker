# FROM alpine:latest

# RUN apk add openssh-client

# RUN addgroup -g 1000 -S ubuntu && \
#     adduser -u 1000 -S ubuntu

# ENTRYPOINT [ "ssh" ]

FROM ubuntu:20.04

RUN apt-get update && apt-get install -y openssh-client autossh
RUN groupadd -g 1000 ubuntu
RUN useradd -u 1000 -g ubuntu ubuntu
ENTRYPOINT [ "autossh" ]
