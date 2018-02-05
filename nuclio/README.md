# Install

For docker hub:

``` bash
kubectl -n nuclio create secret docker-registry registry-credentials \
    --docker-username XXXXXX \
    --docker-password XXXXXX \
    --docker-server registry.hub.docker.com \
    --docker-email ignored@nuclio.io

kubectl -n nuclio create configmap nuclio-registry --from-literal=registry_url=registry.hub.docker.com
```
