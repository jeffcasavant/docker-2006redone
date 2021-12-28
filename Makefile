all: build run

run:
	mkdir -p ./characters && docker-compose up -d && docker-compose logs -f

keys/priv.key:
	mkdir -p keys
	openssl genpkey -algorithm RSA -out keys/priv.key -pkeyopt rsa_keygen_bits:2048
	openssl rsa -modulus -in keys/priv.key 2>/dev/null | head -1 | cut -c 9- >keys/modulus
	openssl rsa -text -in keys/priv.key 2>/dev/null | grep privateExponent -A 18 | tail -18 | sed ':a;N;$$!ba;s/\n/ /g' | sed 's/\s*//g' | sed 's/://g' | tr '[:lower:]' '[:upper:]' >keys/exponent

keys: keys/priv.key
	rm -rf clientdl/keys
	cp -r keys clientdl/keys
	rm -rf server/keys
	cp -r keys server/keys

build: keys
	docker build server -t jeffcasavant/2006redone-server
	docker build fileserver -t jeffcasavant/2006redone-fileserver
	docker build clientdl -t jeffcasavant/2006redone-clientdl

stop:
	docker-compose down -v

clean: stop
