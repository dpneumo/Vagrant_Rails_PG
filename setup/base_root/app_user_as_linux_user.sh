#!/bin/bash
#
# app_user_as_linux_user.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

starting "set app user as linux user"

# Create linux user unless already exists
chkuser="$(sudo getent passwd $APPUSER)"
if ! [ -n "$chkuser" ]
then
  sudo useradd -U -M -p $APPUSER_PW $APPUSER |
    tee -a /var/log/vagrant_setup.log
fi

completed "setting app user as linux user"
