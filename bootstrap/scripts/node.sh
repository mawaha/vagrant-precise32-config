#!/bin/bash

echo -e "\e[42;33minstalling node.js\e[0m"

echo -e "\e[42;33madd PPA to get latest version of node.js\e[0m"
apt-get -y install python-software-properties
add-apt-repository -y ppa:chris-lea/node.js
apt-get update
apt-get -y install nodejs

echo -e "\e[42;33mnode installed\e[0m"