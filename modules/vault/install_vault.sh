#!/bin/bash
apt update -y
apt install -y unzip
wget https://releases.hashicorp.com/vault/1.9.0/vault_1.9.0_linux_amd64.zip
unzip vault_1.9.0_linux_amd64.zip
mv vault /usr/local/bin/
vault --version
