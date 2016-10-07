#!/bin/sh

echo 
"To: otakar@me.com
From: server-status@sstctf.us.to
Subject: Server Status

Hello, you are receiving this email becuase you are listed in /opt/Scripts/Mail.sh. 
Below are some server usage statistics...

$df

$htop

$w

End

" > /opt/server-status.txt

ssmtp "otakar@me.com" < /opt/server-status.txt
ssmtp "andrewquach10@gmail.com" < /opt/server-status.txt
