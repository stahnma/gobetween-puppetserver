#!/bin/sh

containers=`docker ps  --filter label=puppetserver=true --format {{.Ports}} | cut -d\- -f1`

for uri in `echo ${containers}`
do
  if (curl -s -k https://${uri}/production/status/health | grep "is_alive\":true" > /dev/null ) ; then
     echo ${uri}
  fi
done
