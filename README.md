# fah-podman
Folding at home in a container

Currently needs to run as root
AWS instances seem to require --network=host

sudo podman run --network=host --rm -ti --env=USER= --env=TEAM= --env=PASSKEY=  --env=GPU=false --env=SMP=false quay.io/danclark/fahclient:v7.5.1

sudo podman run --network=host --rm -ti --env=GPU=false --env=SMP=true --env=USER=Anonymous quay.io/danclark/fahclient:v7.5.1

