## usage

it's an interactive docker for mega-cmd ie: it stop at the end of the sync,put, get commande

### exemple

Sync

``` bash
docker run --rm --name mega-cmd -e USERNAME='email' -e PASSWORD='password'-e MEGACMD="mega-sync /upload /uploadremote" \
-v 'folder to upload':/upload -v ${PWD}/logs:/root/.megaCmd thelittlefireman/docker-megacmd:latest
```

```bash

docker run --rm --name mega-cmd -e USERNAME='email' -e PASSWORD='password'-e MEGACMD="mega-put /upload" \
-v 'folder to upload':/upload -v ${PWD}/logs:/root/.megaCmd thelittlefireman/docker-megacmd:latest
```