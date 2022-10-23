#
# 用于构建使用 Supervisord 和 uWSGI 基础包（基于 Python 3.10）
#
# Author: Zhongdong Yang
# Email: zhongdong_y@outlook.com
# Copyright: Zhongdong Yang
# Date: 2022-09-26
#

FROM dongsxyz/python-supervisord:alpine
USER root

WORKDIR /app

# ==
# 安装必要的软件
# ==
# 1. OpenResty + uwsgi
RUN apk -U add openresty python3-dev=3.10.8-r1
RUN python3 -m pip install uwsgi

# ==
# 更新配置文件并复制代码文件
# ==

# OpenResty
COPY uwsgi.yml /app/uwsgi.yml
COPY config/uwsgi.conf /app/_supervisor.d/uwsgi.conf
COPY config/nginx/nginx.conf /etc/openresty/openresty.conf

# 为了与基于 Ubuntu 的镜像兼容，这里不再修改目录
COPY config/nginx/sites /usr/local/openresty/nginx/sites
COPY html /app/html
RUN mkdir -p /var/log/openresty/
RUN dos2unix /app/uwsgi.yml