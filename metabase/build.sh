#/bin/sh

apk add  --update-cache --no-cache bash ttf-dejavu fontconfig curl java-cacerts openjdk11-jre-headless

mkdir -p /app/certs

curl https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem -o /app/certs/rds-combined-ca-bundle.pem
keytool -noprompt -import -trustcacerts -alias aws-rds -file /app/certs/rds-combined-ca-bundle.pem -keystore /etc/ssl/certs/java/cacerts -keypass changeit -storepass changeit

curl https://cacerts.digicert.com/DigiCertGlobalRootG2.crt.pem -o /app/certs/DigiCertGlobalRootG2.crt.pem
keytool -noprompt -import -trustcacerts -alias azure-cert -file /app/certs/DigiCertGlobalRootG2.crt.pem -keystore /etc/ssl/certs/java/cacerts -keypass changeit -storepass changeit

mkdir -p /plugins && chmod a+rwx /plugins

curl https://downloads.metabase.com/v0.41.1/metabase.jar -o /app/metabase.jar
curl https://raw.githubusercontent.com/metabase/metabase/master/bin/docker/run_metabase.sh -o /app/run_metabase.sh

chmod +x /app/run_metabase.sh
