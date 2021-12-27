#! /bin/bash

mkdir -p keys
if [ ! -f keys/priv.key ]; then
    # Generate new keys
    #openssl genpkey -algorithm RSA -out keys/priv.key -pkeyopt rsa_keygen_bits:4096
    #openssl rsa -modulus -in keys/priv.key 2>/dev/null | head -1 | cut -c 9- > keys/modulus
    #openssl rsa -text -in keys/priv.key 2>/dev/null | grep privateExponent -A 35 | tail -35 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/\s*//g' | sed 's/://g' | tr '[:lower:]' '[:upper:]' > keys/exponent
    openssl genpkey -algorithm RSA -out keys/priv.key -pkeyopt rsa_keygen_bits:2048
    openssl rsa -modulus -in keys/priv.key 2>/dev/null | head -1 | cut -c 9- >keys/modulus
    openssl rsa -text -in keys/priv.key 2>/dev/null | grep privateExponent -A 18 | tail -18 | sed ':a;N;$!ba;s/\n/ /g' | sed 's/\s*//g' | sed 's/://g' | tr '[:lower:]' '[:upper:]' >keys/exponent
fi
rm -r clientdl/keys
cp -r keys clientdl/keys
rm -r server/keys
cp -r keys server/keys
