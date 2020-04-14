#!/bin/bash
bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1" &
if [[ "$USERNAME" != "NOBODY" ]] && [[ "$PASSWORD" != "CHANGEME" ]]; then
    mega-login $USERNAME $PASSWORD
else
    echo "Please specify a valid username and password with -e USERNAME and -e PASSWORD. Aborting."
    exit 1
fi
if [[ "$MEGACMD" == "" ]]; then
	echo "Please specify a valid -e MEGACMD command"
    	exit 1
elif [[ "$MEGACMD" == *"mega-sync"* ]]; then
# specific to mega-cmd because not interactive ...
	echo "specific actions for mega-sync"
	not_sync="false"
	$MEGACMD
	sleep 10
	while [ $not_sync == "false" ]
	do
		mega-sync
		if mega-sync | grep -iq "Synced"; then
			not_sync="true"
			echo "Sync end"
		fi
		echo "$not_sync"
		sleep 2
	done
	exit $?
else
	$MEGACMD
	exit $?
fi
/bin/bash $@
