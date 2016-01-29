#!/bin/bash
docker run -it -p 8888:8888 \
    -v $PWD/data:/root/data \
    --device="/dev/ttyACM0:/dev/ttyACM0" \
    atong01/rpi-trst
