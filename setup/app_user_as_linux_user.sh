#!/bin/bash
#
# app_user_as_linux_user.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo
echo ===================================
echo =
echo =   set app user as linux user
echo =
echo ===================================

# Create linux user unless already exists
CHKUSER="$(sudo getent passwd $APPUSER)"
if ! [ -n "$CHKUSER" ]
then
  sudo useradd -U -M -p $APPUSER_PW $APPUSER
fi

echo ---
echo setting app user as linux user is complete!
echo ===================================
