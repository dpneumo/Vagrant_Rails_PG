#!/bin/bash
#
# app_user_as_linux_user.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo ===================================
echo =
echo =   set app user as linux user
echo =          $(timestamp)
echo ===================================

# Create linux user unless already exists
chkuser="$(sudo getent passwd $APPUSER)"
if ! [ -n "$chkuser" ]
then
  sudo useradd -U -M -p $APPUSER_PW $APPUSER
fi

echo ---
echo setting app user as linux user is complete!
echo ===================================
