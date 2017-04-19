#!/bin/sh

useradd -m confluence
chown -R confluence /opt/atlassian/confluence/
chown -R confluence /var/atlassian/application-data/confluence/
su confluence -c ./opt/atlassian/confluence/bin/shutdown.sh
su confluence -c ./opt/atlassian/confluence/bin/startup.sh
chmod +x /etc/init.d/confluence
chkconfig --add confluence
chkconfig confluence on
