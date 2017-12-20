############################################################
# Dockerfile to build Python WSGI Application Containers
# Based on Ubuntu
############################################################

# Set the base image to Ubuntu
FROM ubuntu

# File Author / Maintainer
MAINTAINER Xeon Zolt

# Update the sources list
RUN apt-get -y update

# Install basic applications
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential

# Install Python and Basic Python Tools
RUN apt-get install -y python3 python-dev python-distribute python-pip

#telegram-cli
RUN apt-get install -y liblua5.2-0 libconfig9
RUN wget https://bugs.launchpad.net/~miry/+archive/ppa/+files/telegram-cli_0.0.20140125-1_amd64.deb
RUN dpkg -i ./telegram-cli_0.0.20140125-1_amd64.deb
RUN apt-get -f install

# Copy the application folder inside the container
RUN git clone https://github.com/xeon-zolt/TG-IRCbot.git

# Get pip to download and install requirements:
#RUN pip install -r /Flask-OCR/requirements.txt
RUN pip install config

# Expose ports
EXPOSE 80

# Set the default directory where CMD will execute
WORKDIR /TG-IRCbot

# Set the default command to execute    
CMD python3 orizond.py
