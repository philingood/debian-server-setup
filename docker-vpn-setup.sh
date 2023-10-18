#! /bim/sh

clone_repo()
{
    mkdir -p /root/VPN/
    mkdir -p /root/tmp/
    cd /root/tmp/
    git clone https://github.com/philingood/debian-server-setup.git
    cd /root/tmp/debian-server-setup/docker-ikev2-vpn-server
    cp -r data .env Dockerfile adduser.sh build.sh rmuser.sh run.sh start.sh /root/VPN/
    cd /
}

clone_repo