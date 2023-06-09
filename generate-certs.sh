#!/usr/bin/env bash

# Copyright 2023 Calum Murray
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

echo "Generating certificates for localhost tls"

mkdir -p out
mkdir -p tmp

openssl req -x509 -nodes -new -sha256 -days 1024 -newkey rsa:2048 -keyout ./tmp/RootCA.key -out ./tmp/RootCA.pem -subj "/C=US/CN=Example-Root-CA"
openssl x509 -outform pem -in ./tmp/RootCA.pem -out ./out/RootCA.crt
openssl req -new -nodes -newkey rsa:2048 -keyout ./out/localhost.key -out ./tmp/localhost.csr -subj "/C=US/ST=YourState/L=YourCity/O=Example-Certificates/CN=localhost.local"
openssl x509 -req -sha256 -days 1024 -in ./tmp/localhost.csr -CA ./tmp/RootCA.pem -CAkey ./tmp/RootCA.key -CAcreateserial -extfile domains.ext -out ./out/localhost.crt

rm -rf tmp
