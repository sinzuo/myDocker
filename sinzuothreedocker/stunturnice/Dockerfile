FROM ubuntu:16.04
MAINTAINER jiang_yi_bo <admin@sinzuo.com>

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

EXPOSE 3478

RUN apt-get update && apt-get install -y \
    dnsutils \
    coturn \
  && rm -rf /var/lib/apt/lists/*
  

ENTRYPOINT ["bash", "deploy-turnserver.sh"]    
