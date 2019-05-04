#!/usr/bin/env bash


function apt_config () {
    is_updated=`diff ./sources.list /etc/apt/sources.list`
    if [ $is_updated -ne 0 ]; then
        sudo cp /etc/apt/sources.list /etc/apt/sources.list.orig
        sudo cp ./sources.list /etc/apt/sources.list
        sudo apt update
    fi
}