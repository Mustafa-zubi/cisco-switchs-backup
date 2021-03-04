#!/usr/bin/expect -f
        set timeout 20
        set IPaddress [lindex $argv 0]
        set Username "cisco"
        set Password "xxxxx"
        set Directory /root/cisco/logs
	set TFTP_Root_Directory /var/lib/tftpboot/Configrations/Catalyst-Switches
## Create Backup Directory +%Y%m%d%H%M%S
	#set DATE [exec date +%F]
        set DATE [exec date +%F]
        set BCK_Directory $TFTP_Root_Directory/$DATE

        #if {[file exist $BCK_Directory]} {
        #        # check that it's a directory
        #        puts "The Folder $BCK_Directory is alredy exists, please change or delete it"
        
        #}
	cd $TFTP_Root_Directory
	#exec mkdir "$DATE"
        spawn chmod 777 $DATE
        cd $BCK_Directory
	
        log_file -a $BCK_Directory/session_$IPaddress.log
        set fileId [open $IPaddress.cfg "a+"]
        spawn chmod 777 $IPaddress.cfg
	#log_file -a $TFTP_Root_Directory/bck_$IPaddress
        send_log "### /START-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
        
	spawn ssh -o "StrictHostKeyChecking no" $Username@$IPaddress
        expect "*assword: "
        send "$Password\r"
        expect ">"
	send "en\r"
	expect "*assword: "
	send "$Password\r"	
	expect "#"
	
        send "copy running-config tftp://10.1.100.22/Configrations/Catalyst-Switches/$DATE/$IPaddress.cfg\r"
	#send "copy flash:/config.text tftp\r"
	expect "Address or name of remote host*?"
	send "\r"
	#expect "[config.text]?"
	send "\r"	

	


	#send "show run confi"

        #send "int g0/0\r"

        #expect "(config-if)#"

        #send "shut\r"

        #expect "(config-if)#"

        #send "exit"

        #expect "(config)#"

        send "exit\r"

        expect "#"

        #send "wr\r"

        #expect "#"

        send "exit\r"

        sleep 1

        send_log "\r### /END-SSH-SESSION/ IP: $IPaddress @ [exec date] ###\r"
        

exit
