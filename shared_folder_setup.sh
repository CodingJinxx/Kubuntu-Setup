#!/usr/bin/env bash

grep -qxF 'user_allow_other' /etc/fuse.conf || sudo echo 'user_allow_other' >> /etc/fuse.conf
mkdir -p /home/$USER/Shares
/usr/bin/vmhgfs-fuse .host:/ /home/$USER/Shares -o subtype=vmhgfs-fuse,allow_other
