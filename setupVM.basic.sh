#!/bin/bash
#jfos 8-6-18

#Install java
apt-get update
apt install -y openjdk-8-jre-headless

#Create a random password on the VM at the time of provisioning, note the password isnt stored HERE!!
mypass=$(< /dev/urandom tr -dc _A-Z-a-z-0-9 | head -c${1:-32};echo;)

#Assign the created password to the user account allowed by SoftLayer (ie root)
echo -e "$mypass\n$mypass" | passwd root

#Put it in a file that gets deleted in just a bit once we get set, so we can know the passwd
echo "MYPASS is $mypass" > /root/VM.props


