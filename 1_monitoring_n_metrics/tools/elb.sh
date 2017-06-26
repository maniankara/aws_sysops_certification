#!/usr/bin/env bash

function usage {
    echo "Usage:";
    echo "  ./$(basename $0) <url>"
    echo "  ./$(basename $0) http://awscertlb-xxxxxxx.eu-west-1.elb.amazonaws.com"
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
    echo "Starting loading function";
    echo "This will execute curl command every half minute for 1 hour approx."
    for i in {1..120}
    do
        http_get $1;
        sleep 30;
    done
}

main $*;