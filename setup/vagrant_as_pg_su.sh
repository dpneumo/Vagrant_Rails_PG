#!/bin/bash
#
# vagrant_as_pg_su.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#

echo
echo ===================================
echo =
echo =   set vagrant as pg superuser
echo =
echo ===================================

# Attempt creation of vagrant superuser role. Swallow failure.
$(sudo -u postgres createuser --superuser vagrant || true)

echo ---
echo setting vagrant as pg superuser is complete!
echo ===================================
