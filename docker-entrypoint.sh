#!/bin/bash
set -e
cp -f /www/000-default.conf /etc/apache2/sites-enabled/

if [ $(grep -c $SERVERNAME /etc/apache2/apache2.conf) -eq 0 ]; then
    echo "ServerName $SERVERNAME" >> /etc/apache2/apache2.conf
fi

if [ ! -f /www/teamstatus/teamstatus.sqlite3 ]; then
    cp /www/teamstatus/teamstatus.sqlite3.default /www/teamstatus/teamstatus.sqlite3
fi

chown www-data:www-data /www/teamstatus/teamstatus.sqlite3
exec /usr/sbin/apache2ctl -D FOREGROUND