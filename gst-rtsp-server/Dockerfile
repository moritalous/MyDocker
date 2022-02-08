FROM ubuntu:20.04

RUN apt-get update && apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    git \
    libssl-dev \
    libcurl4-openssl-dev \
    liblog4cplus-dev \
    libgstreamer1.0-dev \
    libgstreamer-plugins-base1.0-dev \
    libgstreamer-plugins-bad1.0-dev \
    gstreamer1.0-plugins-base-apps \
    gstreamer1.0-plugins-bad \
    gstreamer1.0-plugins-good \
    gstreamer1.0-plugins-ugly \
    gstreamer1.0-tools \
    meson \
    cmake \
    gobject-introspection \
    libcgroup-dev \
    libgirepository1.0-dev && \
    rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/GStreamer/gst-rtsp-server.git && \
    cd gst-rtsp-server && \
    git checkout 1.16.2 && \
    meson build && \
    cd build && \
    ninja && \
    ninja install && \
    mkdir -p /opt/gst-rtsp-server && \
    cp -rf ../build/* /opt/gst-rtsp-server && \
    rm -rf /gst-rtsp-server

WORKDIR /opt/gst-rtsp-server/examples
ENTRYPOINT ["./test-launch", "'( videotestsrc ! x264enc ! rtph264pay name=pay0 pt=96 )'"] 
