# localhost-tls
This repo contains a script to generate valid tls certificates which support localhost addresses.

## Set up
To use the script, you need to have [OpenSSL](https://www.openssl.org/) installed on your machine.

## Usage
To generate a self-signed root CA certificate, certificate, and key which all work with `localhost` and `127.0.0.1` addresses, run:
```sh
./generate-certs.sh
```
The root CA certificate will be in `./out/RootCA.crt`, the TLS certificate will be in `./out/localhost.crt`, and the TLS key will be in `./out/localhost.key`.