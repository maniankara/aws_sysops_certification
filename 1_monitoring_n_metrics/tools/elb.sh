#!/usr/bin/env bash

function usage {
    echo "Usage:";
    echo "  ./$(basename $0) <url> [<duration in seconds>]"
    echo "  ./$(basename $0) http://awscertlb-xxxxxxx.eu-west-1.elb.amazonaws.com 120"
    exit -1;
}
function http_get {
    output=$(curl -X GET $1 &>/dev/null);
    if [ $? -ne 0 ]; then
        echo "The command: 'curl -X GET $1' fails";
        exit -1;
    fi
}

function main {
    if [ "$1" = "" ]; then
        usage;
    fi
    d=$2;
    if [ "$2" = "" ]; then
        d=120;
    fi
    times=$(expr $d / 30);
    echo "Starting loading function";
    echo "This will execute curl command every half minute for $times times"
    i=1;
    while [ $i -le $times ]; do
        http_get $1;
        i=$(expr $i + 1);
        sleep 30;
    done
}

main $*;