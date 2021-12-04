FROM amazonlinux:2

RUN yum install -y util-linux initscripts aws-kinesis-agent

CMD ["sh",  "-c", '/etc/init.d/aws-kinesis-agent start; sleep 20; tail -f /var/log/aws-kinesis-agent/aws-kinesis-agent.log']