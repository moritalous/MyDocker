#/bin/sh

cd /opt/gst-rtsp-server/examples
./test-launch '( videotestsrc ! x264enc ! rtph264pay name=pay0 pt=96 )'
