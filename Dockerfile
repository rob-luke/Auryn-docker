FROM phusion/baseimage:master

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

# Install requirements
RUN apt-get update && \
    apt-get install -y \
    cmake \
    git \
    build-essential \
    libboost-all-dev
    
# Install auryn
RUN git clone https://github.com/fzenke/auryn.git
RUN cd auryn/build/release && ./bootstrap.sh && make    

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
