#!/usr/bin/env bash

# This is a tool generated to create load on IO for graphing EBS metrics in AWS (EC2) servers
# The tool is not intended to run on anywhere (esp. not on local workstation) else.

# Some random ext4 fs
any_random_ext4_fs=$(df -h -t ext4|grep -v Filesystem|awk {'print $1'});

# On Ctrl+c
trap 'echo Performing cleanup && cleanup && exit' INT


function load {
    # Copy the file system to an image file
    dd if=$any_random_ext4_fs of=/tmp/ext4.img &
}


function cleanup {
    # stop the process
    killall dd 2>/dev/null;

    # remove the image and repeat
    rm /tmp/ext4.img;
}



while true; do
    load;

    # wait a while, do not wait too long as rootfs might get full
    sleep 2;

    cleanup;

done