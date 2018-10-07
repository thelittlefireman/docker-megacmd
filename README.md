docker run --rm --name mega-cmd -e USERNAME='email' -e PASSWORD='password' -e TARGET=$REMOTE_BACKUP \
-v 'folder to upload':/upload -v ${PWD}/logs:/root/.megaCmd thelittlefireman/docker-megacmd:latest
