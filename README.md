# cisco-switchs-backup

This a very basic and simple script to backup RUNNING CONFIGRATION on CISCO Catalyst Switches. 

Note: it is ment to work fine with catalyst switches, but there should be no reson to not have it working with other cisco switches if ssh is enabled on them. 


To backup catalyst switches you need to do the following:

Login to your server/pc () 
go to /root/cisco
make sure that all switches IPs are listed in this file IP-list
also, you need make sure that the switch ssh is enabled, username is cisco and the password is the network switches password -- this is the only way to have the backup working.
run this script get-catalyst-configration.sh
make sure that no errors are appeared.
the configuration files will be listed in this path /var/lib/tftpboot/Configrations/Catalyst-Switches
In the above path, you can run ll command, if all is fine you should not see any file with 0 size.
In case you are adding a new switch, make ssh access to that new switch from server for the 1st time only and then you have to follow the instructions mentioned above.
