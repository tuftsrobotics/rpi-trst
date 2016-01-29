FROM resin/rpi-raspbian:wheezy

MAINTAINER      Alexander Tong <alexanderytong@gmail.com>

WORKDIR         /root
RUN             apt-get update && apt-get install -y \
                    gcc \
                    make \
                    python \
                    python-dev \
                    python-pip

###############################################################################

RUN             pip install Flask
RUN             pip install latlon
RUN             pip install argparse
RUN             pip install pyserial
RUN             pip install gpxpy
RUN             pip install requests

###############################################################################

COPY            canboat /root/canboat

###############################################################################

WORKDIR         /root/canboat

RUN             make -j4 && make install

###############################################################################

WORKDIR         /root
RUN             apt-get -y purge \
                    gcc \
                    make
RUN             apt-get -y autoremove
RUN             rm -rf $HOME/canboat $HOME/.cache/pip/ /var/lib/apt/lists/* /tmp/*

ENTRYPOINT      ["/bin/bash"]
