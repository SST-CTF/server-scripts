#!/bin/bash 
#
# This script clears the guest home directory, sets a random new password
# and then makes sure the admins have quick and easy access to this pass.
#
# *MUST BE ROOT FOR SCRIPT TO WORK*
#
# 10/7/2016
# Otakar Andrysek
# SST CTF
#

# Variables for easy adaptability
ACCOUNT=guest
DATE=$(date --date="next day" +%A" "%B" "%d" "%Y)
TXT_FILE_NAME="GuestPass"
EMAIL_SUBJECT="Guest Account Password"
EMAIL_TO="sstctf@gmail.com"

# Clean up
killall -u $ACCOUNT
cd /home/$ACCOUNT
rm -r *

# Create a new password
NEW_PASS=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
echo "The new guest account for $DATE is: "
echo $NEW_PASS

# Set the new password
echo "$ACCOUNT:$NEW_PASS" | chpasswd

# Print the password into a file to the /root folder
cat >/root/$TXT_FILE_NAME <<EOL
Account: $ACCOUNT
Date: $DATE
Password: $NEW_PASS
EOL
cat /root/$TXT_FILE_NAME

# Email the password, too.
cat /root/$TXT_FILE_NAME | mail -s "$EMAIL_SUBJECT" $EMAIL_TO

#END
