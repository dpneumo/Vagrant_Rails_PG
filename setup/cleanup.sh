#!/bin/bash
#
# cleanup.sh
#
# Copyright (C) 2015 Mitchell C Kuppinger, MD
#
echo "++ Clean up ++" | tee -a /var/log/vagrant_setup.log

# Clean PATH
# http://unix.stackexchange.com/questions/40749/remove-duplicate-path-entries-with-awk-command
export PATH=$(echo -n $PATH | awk -vRS=: -vORS= '!a[$0]++ {if (NR>1) printf(":"); printf("%s", $0) }' )

