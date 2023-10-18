#!/bin/sh
docker rm -t ikev2-vpn-server
docker build -t drzhnin/docker-ikev2-vpn-server .