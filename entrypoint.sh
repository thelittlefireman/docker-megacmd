#!/bin/bash
bash -c  "nohup tail -f /root/.megaCmd/megacmdserver.log >&0 2>1" &
if [[ "$USERNAME" != "NOBODY" ]] && [[ "$PASSWORD" != "CHANGEME" ]]; then
    mega-login $USERNAME $PASSWORD
else
    echo "Please specify a valid username and password with -e USERNAME and -e PASSWORD. Aborting."
    exit 1
fi
if [ -d /upload ]; then
	mega-put /upload $TARGET
else
    echo "Please mount the dir that you want to upload to /upload and set \$TARGET to remote dir. Aborting."
    exit 1
fi
/bin/bash $@