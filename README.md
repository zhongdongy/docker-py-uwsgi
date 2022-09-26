## Python-uWSGI Docker Image

### Contents of the image

This image is built on Python-Supervisord image

Software/Libraries included:

- curl
- dos2unix
- python3.10
- python3.10-dev
- python3.10-distutils
- supervisord
- uwsgi

### Usage

Please refer to this [demo repository](https://github.com/zhongdongy/docker-py-uwsgi-demo) for information.

You will need to override the `/app/uwsgi.yml` file to suits your need.