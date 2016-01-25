**How to use this image**
===============


    /usr/bin/docker run  \
       --name keepalived \
       --net host \
       --cap-add=NET_ADMIN \
       -e "ROLE=MASTER" \
       -e "VIP=192.168.0.1" \
       -e "priority=101" \
       -e "vrouterid=51" \
       -e "interface=eth0" \
       -e "auth_pass=supersecret" \
       quay.io/kaufmann_r/docker-keepalived:latest




**Environment Variables**
===============
When you start the docker-keepalived image, you can adjust the configuration by passing one or more environment variables on the docker run command line.

## ROLE
* the keepalived state

## VIP
* the Virtual IP Address

## priority
* keepalived priority

## vrouterid
* the virtual router id

## interface
* interface to listen on

## auth_pass
* the authentication password.

