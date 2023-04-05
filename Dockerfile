# This dockerfile user the ubuntu image
# VERSION 2 - EDITON 1
# Author: docker_user
# Command format: Instruction [arguments / command] ..

# 第一行必须指定基于的基础镜像
FROM mixnet/node:v18

# 维护者信息
MAINTAINER  light xxxxxx@email.com

RUN mkdir /app
WORKDIR /app

COPY Caddyfile /root/
COPY init-container.sh /root/
COPY bootstrap.sh /root/
RUN chmod a+x /root/bootstrap.sh
RUN sh /root/init-container.sh
RUN rm -rf /root/init-container.sh

# pm2 stop mdproxy-server && pm2 start mdproxy-server -- -p
ENTRYPOINT ["/root/bootstrap.sh"]