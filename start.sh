#!/bin/bash
device0="/dev/ttyACM0"
device1="/dev/ttyACM1"
if [ -e "$device0" ]
then
    docker run -it -p 8888:8888 \
        -v $PWD/data:/root/data \
        -v $PWD/trst:/root/trst \
        --device="/dev/ttyACM0:/dev/ttyACM0" \
        atong01/rpi-trst-base
fi
echo "Device 0 not found at /dev/ttyACM0"
