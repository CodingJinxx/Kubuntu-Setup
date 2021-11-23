#!/usr/bin/env bash

sudo apt update && apt -y install ca-certificates wget net-tools gnupg
sudo wget -qO - https://as-repository.openvpn.net/as-repo-public.gpg | apt-key add -
sudo echo "deb http://as-repository.openvpn.net/as/debian focal main">/etc/apt/sources.list.d/openvpn-as-repo.list
sudo apt update && apt -y install openvpn-as
sudo apt-get install -y network-manager-openvpn 