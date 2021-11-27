FROM ubuntu:20.04 as build

ENV KVS_VERSION=v3.2.0

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    cmake \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools \
    libgstreamer-plugins-base1.0-dev \
    automake \
    build-essential \
    pkg-config && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /opt/awssdk

RUN git clone -b ${KVS_VERSION} --recursive  https://github.com/awslabs/amazon-kinesis-video-streams-producer-sdk-cpp.git && \
    cd amazon-kinesis-video-streams-producer-sdk-cpp && \
    git submodule update --init && \
    mkdir build && \
    cd build && \
    cmake -DBUILD_GSTREAMER_PLUGIN=ON .. && \
    make

FROM ubuntu:20.04

ENV STREAM_NAME=stream-name
ENV ACCESS_KEY=access-key
ENV SECRET_KEY=secret-key
ENV AWS_REGION=aws-region

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools && \
    rm -rf /var/lib/apt/lists/*

COPY --from=build /opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/build /opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/build
COPY --from=build /opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib /opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

ENV GST_PLUGIN_PATH=/opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/build
ENV LD_LIBRARY_PATH=/opt/awssdk/amazon-kinesis-video-streams-producer-sdk-cpp/open-source/local/lib

ENTRYPOINT gst-launch-1.0 v4l2src do-timestamp=TRUE device=/dev/video0 \
    ! videoconvert \
    ! video/x-raw,format=I420,width=640,height=480,framerate=30/1 \
    ! x264enc bframes=0 key-int-max=45 bitrate=500 \
    ! video/x-h264,stream-format=avc,alignment=au,profile=baseline \
    ! kvssink stream-name=${STREAM_NAME} storage-size=512 \ 
    access-key=${ACCESS_KEY} secret-key=${SECRET_KEY} aws-region=${AWS_REGION}
