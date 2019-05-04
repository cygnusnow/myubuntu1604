#!/usr/bin/env bash

function tools_install () {
    # install tools by default
    for app in `cat ./tools.txt`
    do
        is_installed=`aptitude show git | grep State | awk '{print $2}'`
        if [ x'installed' = x$is_installed ]; then
            echo "$app is already installed."
            echo "##########################"
            continue
        fi
        sudo apt-get -y install $app
    done
}

function tools_app_config () {
    
    # git editor
    git config --global core.editor vim
}

