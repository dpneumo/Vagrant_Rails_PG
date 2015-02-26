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
CHKUSER="$(sudo getent passwd ember_crm)"
if ! [ -n "$CHKUSER" ]
then
  sudo useradd -U -M -p Dragon123 ember_crm
fi

echo ---
echo setting app user as linux user is complete!
echo ===================================
