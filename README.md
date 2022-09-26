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

You will need to override the `/app/uwsgi.yml` file to suits your need.

Your uWSGI application needs to listen on port 5000 in order to receive default port forwarding from OpenResty. If you 
prefer a different port, please replace `/usr/local/openresty/nginx/sites/main.conf`, which forwards 8080 to 5000 (uWSGI).