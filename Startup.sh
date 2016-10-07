#!/bin/bash

# Schedule a startup on the RTC 23 hours and 55 minutes in advance
## This assumes this script runs at 8AM, the server will start a bit before 8 AM the next day
sh -c "echo 0 > /sys/class/rtc/rtc0/wakealarm" 
sh -c "echo `date '+%s' -d '+ 450 minutes'` > /sys/class/rtc/rtc0/wakealarm" 

wall "Startup is set"
