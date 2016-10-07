# Clear out the home
cd /home/guest
rm -r *

# Create a new password
initialize_password_change="passwd guest"
eval $initialize_password_change
#Usually don't use this command, only use set_guest_password

generate_new_password='eval [Insert Random Password Generating Program]'
eval $generate_new_password

set_guest_password="$initialize_password_change [Insert Input Command Data From ->] $generate_new_password"

# Print the password to the /root folder
echo $set_guest_password [To /Root Folder]

# Email the password, too.
eval $sstmp [Insert Email Command, then Input To:, From:, Subject:, then Quit]
