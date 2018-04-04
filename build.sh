#! /bin/bash

mkdir -p keys
if [ ! -f keys/priv.key ]; then
    # Generate new keys
    openssl genpkey -algorithm RSA -out keys/priv.key -pkeyopt rsa_keygen_bits:4096
    openssl rsa -modulus -in keys/priv.key 2>/dev/null | head -1 | cut -c 9- > keys/modulus
    openssl rsa -text -in keys/priv.key 2>/dev/null | grep privateExponent -A 35 | tail -35 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/\s*//g' | sed 's/://g' | tr '[:lower:]' '[:upper:]' > keys/exponent
fi
cp -r keys clientdl/keys
cp -r keys server/keys

docker build server -t jeffcasavant/2006redone-server
docker build fileserver -t jeffcasavant/2006redone-fileserver
docker build clientdl -t jeffcasavant/2006redone-clientdl
docker push jeffcasavant/2006redone-server
docker push jeffcasavant/2006redone-fileserver
docker push jeffcasavant/2006redone-clientdl
