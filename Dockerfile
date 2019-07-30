# Use python3.7
# See https://docs.docker.com/samples/library/python/ for latest 
FROM python:3.7

LABEL maintainer="Tom Titcombe <t.j.titcombe@gmail.com>"

# Working directory is / by default. We explictly state it here for posterity
WORKDIR /

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       apt-utils \
       build-essential \
       curl \
       xvfb \
       ffmpeg \
       xorg-dev \
       libsdl2-dev \
       swig \
       cmake \
       python-opengl

# Upgrade pip3
RUN pip3 install --upgrade pip

# Move the requirements file into the image
COPY requirements.txt /tmp/

# Install the python requirements on the image
RUN pip3 install --trusted-host pypi.python.org -r /tmp/requirements.txt

# Remove the requirements file - this is no longer needed
RUN rm /tmp/requirements.txt

# Create a directory in which we can do our work
RUN mkdir /home/my_rl/

# Set it as the working directory
WORKDIR /home/my_rl/

# Copy over the start-up script
ADD scripts/startup_script.sh /usr/local/bin/startup_script.sh

# Give permissions to execute
RUN chmod 777 /usr/local/bin/startup_script.sh

# Set the display when we run the container. This allows us to record without the user needing to type anything explicitly
# This code snippet was taken from https://github.com/duckietown/gym-duckietown/issues/123
#ENTRYPOINT ["sh", "/startup_script.sh"]

ENTRYPOINT ["/usr/local/bin/startup_script.sh"]
