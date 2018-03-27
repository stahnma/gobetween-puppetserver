#!/bin/sh

#  $1 is ip
#  #2 is port

#echo "`date` Arguments $*"  

if (curl -s -k https://$1:$2/production/status/health | grep "alive\":true" &> /dev/null  ) ; then
  echo -n 0
else
  echo -n 1
fi
