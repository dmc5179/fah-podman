# fah-podman
Folding at home in a container

## Building

Set CLIENT_VERSION to one of the supported values

Supported BETA Versions:
7.4.15
7.4.16
7.4.17
7.4.18
Supported Release Version:
7.5.0
7.5.1


```
buildah bud --build-arg CLIENT_VERSION=7.4.15 -t quay.io/fah/fah-client:v7.4.15 -f Dockerfile .
```

or

```
make DARGS="--build-arg CLIENT_VERSION=7.6.6" build/client:v7.6.6
```
