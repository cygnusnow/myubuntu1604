#!/usr/bin/env bash

function get_gitlab () {
    
    sudo apt-get install -y curl openssh-server ca-certificates
    sudo apt-get install -y postfix
    curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.deb.sh | sudo bash
    # Please note the defaault EXTERNAL_URL is "gitlab.segmentfault.top",
    # please update it in /etc/gitlab.rb after you installed gitlab
    sudo EXTERNAL_URL="https://gitlab.segmentfault.top" apt-get install gitlab-ee
}
