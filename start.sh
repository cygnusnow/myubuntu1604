#!/usr/bin/env bash

source ./dev_tools/apt_config/apt_config.sh
source ./dev_tools/tools/tools.sh
source ./dev_tools/gitlab/gitlab.sh

DEV_TOOLS_TOOLS="./dev_tools/tools/"
DEV_TOOLS_APT_CONFIG="./dev_tools/apt_config/"
DEV_TOOLS_GITLAB="./dev_tools/gitlab/"

# Update the apt to chinese local repo
pushd $DEV_TOOLS_APT_CONFIG
apt_config
popd

# Install tools by default
pushd $DEV_TOOLS_TOOLS
tools_install
tools_app_config
popd

# Install gitlab for ubuntu 16.04
pushd $DEV_TOOLS_GITLAB
is_gitlab_installed=`which gitlab-ctl | wc -l`
if [ $is_gitlab_installed -ne 1 ]
then
    get_gitlab
fi
popd