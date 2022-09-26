#
# 用于构建使用 Supervisord 和 uWSGI 基础包（基于 Python 3.10）
#
# Author: Zhongdong Yang
# Email: zhongdong_y@outlook.com
# Copyright: Zhongdong Yang
# Date: 2022-09-26
#

FROM dongsxyz/python-supervisord:latest
USER root

WORKDIR /app

# ==
# 安装必要的软件
# ==
# 1. OpenResty + uwsgi
RUN apt-get update && apt-get -y install --reinstall build-essential wget gnupg vim net-tools g++
RUN wget -O - https://openresty.org/package/pubkey.gpg | apt-key add -
RUN echo "deb http://openresty.org/package/ubuntu focal main" \
  | tee /etc/apt/sources.list.d/openresty.list
RUN apt-get update && apt-get -y install openresty
RUN python3 -m pip install uwsgi

# ==
# 更新配置文件并复制代码文件
# ==

# OpenResty
COPY uwsgi.yml /app/uwsgi.yml
COPY config/uwsgi.conf /app/_supervisor.d/uwsgi.conf
COPY config/nginx/nginx.conf /usr/local/openresty/nginx/conf/nginx.conf
COPY config/nginx/sites /usr/local/openresty/nginx/sites
COPY html /app/html
RUN mkdir -p /var/log/openresty/
RUN dos2unix /app/uwsgi.yml