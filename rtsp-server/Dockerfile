FROM aler9/rtsp-simple-server AS rtsp
FROM alpine:3.12
RUN apk add --no-cache ffmpeg
COPY --from=rtsp /rtsp-simple-server /
COPY --from=rtsp /rtsp-simple-server.yml /

RUN ffmpeg -f lavfi -i testsrc2=size=800x600:r=10:d=60 -vcodec libx264 /testsrc2_h264_800x600_r10_d60.mp4

ENTRYPOINT [ "/rtsp-simple-server" ]
