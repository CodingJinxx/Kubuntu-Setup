#!/usr/bin/env bash

echo "Installing Fish"
sudo apt-add-repository ppa:fish-shell/release-3 -y
sudo apt-get update -y
sudo apt-get install -y fish
grep -qxF '/usr/bin/fish "' /etc/shells || echo '/usr/local/bin/fish' >> /etc/shells
chsh -s /usr/local/bin/fish
echo "Installed Fish"
