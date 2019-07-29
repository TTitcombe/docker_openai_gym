# Use python3.7
# See https://docs.docker.com/samples/library/python/ for latest 
FROM python:3.7

LABEL maintainer="Tom Titcombe <t.j.titcombe@gmail.com>"

WORKDIR /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential \
       curl \
       xvfb \
       xorg-dev \
       libsdl2-dev \
       swig \
       cmake \
       python-opengl


# Upgrade pip3
RUN pip3 install --upgrade pip

COPY requirements.txt /tmp/
#    Install required packages
#    This includes gym, numpy, and pytorch (non-gpu)
#    but also useful packages for data science, like
#    matplotlib, pandas, seaborn.
RUN pip3 install --trusted-host pypi.python.org -r /tmp/requirements.txt
