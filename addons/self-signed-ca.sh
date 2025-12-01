#!/bin/sh
set -eu

# This should be a non-localhost IPv4
CERTIFICATE_IP=$(hostname -I | cut -d" " -f1)

mkdir -p certs
openssl req \
 -newkey rsa:4096 -nodes -sha256 -keyout certs/registry.key \
 -subj "/CN=self-signed-ca" \
 -addext "subjectAltName = IP:$CERTIFICATE_IP" \
 -x509 -days 365 -out certs/registry.crt

sudo cp certs/registry.crt /usr/local/share/ca-certificates/registry.crt
sudo update-ca-certificates

sudo systemctl restart docker

echo "CERTIFICATE_IP=$CERTIFICATE_IP" >> "$GITHUB_ENV"
