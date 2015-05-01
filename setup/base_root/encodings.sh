#!/bin/bash
#
# encodings.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

starting "Setup encodings"

sudo locale-gen en_US.UTF-8

sudo chmod 666 /etc/default/locale
sudo cat - > /etc/default/locale <<EOF
LANG=en_US.UTF-8
LANGUAGE=
LC_CTYPE="en_US.UTF-8"
LC_NUMERIC="en_US.UTF-8"
LC_TIME="en_US.UTF-8"
LC_COLLATE="en_US.UTF-8"
LC_MONETARY="en_US.UTF-8"
LC_MESSAGES="en_US.UTF-8"
LC_PAPER="en_US.UTF-8"
LC_NAME="en_US.UTF-8"
LC_ADDRESS="en_US.UTF-8"
LC_TELEPHONE="en_US.UTF-8"
LC_MEASUREMENT="en_US.UTF-8"
LC_IDENTIFICATION="en_US.UTF-8"
LC_ALL=en_US.UTF-8
EOF
sudo chmod 644 /etc/default/locale

completed "setting encodings"
