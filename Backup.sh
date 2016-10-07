#!/bin/bash

# Warn users one minute in advance
wall Server will automatically backup in one minute. Save your work.

# Let the minute pass
sleep 60

# Tell users the backup has begun
wall Server is begining backup on $(date). EXPECT LAG.

# Acutally backup the whole server (but not the backups folder for obvious reasons)
tar --exclude='/opt/Backups' --exclude='/var/backups/' --exclude='/var/cache/' --exclude='/var/lock/' --exclude='/var/run/' --exclude='/var/spool/' -zcvf "/opt/Backups/$(date '+%y-%m-%d').tar.gz" /home/ /etc/ /var/ /usr/local/ /opt/ /srv/ /root/
sleep 1

# Delete old backups
find /opt/Backups* -mtime +9 -exec rm {} \;
sleep 1

# Tell users the backup is complete
wall Backup Success!
