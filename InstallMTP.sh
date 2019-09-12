#!/bin/bash
 sudo -s yum install firewalld
 systemctl enable firewalld
 systemctl start firewalld
 sudo -s yum -y install https://extras.getpagespeed.com/release-el7-latest.rpm 
 sudo -s yum -y install mtproxy
 systemctl enable --now mtproxy
 sudo -s firewall-cmd --zone=public --add-service=https --permanent
 sudo -s firewall-cmd --reload
 cd /etc/mtproxy
 rm -f mtproxy.params
 touch mtproxy.params
 chmod 0777 mtproxy.params
 echo "MTPROXY_USER=mtproxy
 MTPROXY_CLIENT_PORT=443
 MTPROXY_STATS_PORT=8888
 # Number of workers. You can increase the number of workers, if you have a powerful server
 MTPROXY_WORKERS=1
 # Any additional switches for daemon:
 DAEMON_OPTS="-P de640994b8b171d8647de1ac6696df31"
 " >> mtproxy.params
 rm -f secret
 touch secret
 chmod 0777 secret
 echo "MTPROXY_SECRET=00000000000000000000000000000000" >> secret
 systemctl restart mtproxy
 echo "COOL! Every Thing Work Fine Mohamad :)"
