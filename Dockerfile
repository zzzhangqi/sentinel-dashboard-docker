FROM openjdk:8-jdk-alpine3.8

ENV VERSION=1.8.6

WORKDIR /opt

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk add --no-cache wget \
  && wget https://ghproxy.com/https://github.com/alibaba/Sentinel/releases/download/1.8.6/sentinel-dashboard-$VERSION.jar

CMD java -Dserver.port=$PORT -Dcsp.sentinel.dashboard.server=localhost:$PORT -Dproject.name=sentinel-dashboard -jar /opt/sentinel-dashboard-$VERSION.jar