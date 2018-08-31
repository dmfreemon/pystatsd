#!/bin/bash

SERVICENAME=pystatsd.service

systemctl stop $SERVICENAME
systemctl disable $SERVICENAME

# we should be able to soft link this -- this is a bug in systemd
# apparently centos 7 does not have the fix yet
#ln -s /opt/pystatsd/systemd/pystatsd.service /etc/systemd/system/
cp pystatsd.service /etc/systemd/system/

systemctl daemon-reload

systemctl enable $SERVICENAME
systemctl start $SERVICENAME

