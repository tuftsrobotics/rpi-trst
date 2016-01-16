FROM resin/rpi-raspbian:wheezy

MAINTAINER Alexander Tong <alexanderytong@gmail.com>

WORKDIR /root
RUN apt-get update && apt-get install -y python python-dev python-pip git gcc make

ADD requirements.txt /root/requirements.txt

RUN pip install -r requirements.txt

COPY trst /root/trst
COPY canboat /root/canboat

WORKDIR /root/canboat

RUN make && make install

WORKDIR /root

CMD ["bash"]
