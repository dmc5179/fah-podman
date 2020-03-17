# fah-podman
Folding at home in a container

# If part of a team
sudo podman run --rm -ti --env=USER= --env=TEAM= --env=PASSKEY=  --env=GPU=false --env=SMP=false quay.io/danclark/fahclient:v7.5.1

# To run anonymously
sudo podman run --rm -ti --env=GPU=false --env=SMP=true --env=USER=Anonymous quay.io/danclark/fahclient:v7.5.1

