# Docker Compose Down

Ever seen the error

```bash
docker-compose up
Recreating example-search-platform_datastore_1 ... error

ERROR: for example-search-platform_datastore_1  b'no such image: sha256:b3def9a4744708e197d783b59f234a359116ef737af6600b5273c94cecdd7000: No such image: sha256:b3def9a4744708e197d783b59f234a359116ef737af6600b5273c94cecdd7000'

ERROR: for datastore  b'no such image: sha256:b3def9a4744708e197d783b59f234a359116ef737af6600b5273c94cecdd7000: No such image: sha256:b3def9a4744708e197d783b59f234a359116ef737af6600b5273c94cecdd7000'
ERROR: The image for the service you're trying to recreate has been removed. If you continue, volume data could be lost. Consider backing up your data before continuing.
```

That is because you did not run `docker-compose down` but instead ran something like `docker rmi -f $(docker images -q)` to clean out the image cache.  Docker compose has a tempoarary image cache it uses for orchestration and when you blow away the main docker image cache docker compose will get very confused and try to recreate the image.
