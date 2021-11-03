docker run --name grafana --security-opt seccomp=unconfined alpine:latest apk add grafana
 
docker commit --change='CMD ["grafana-server", "-config", "/etc/grafana.ini", "-homepath", "/usr/share/grafana", "web"]' -c "EXPOSE 3000" $(docker ps -lq) moritalous/grafana
