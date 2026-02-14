#!/bin/bash

echo "Security Permissions Lab"

mkdir -p security_test

echo "secret" > security_test/secret.txt

ls -l security_test/

sudo chown root:root security_test/secret.txt

ls -l security_test/

sudo chmod 640 security_test/secret.txt

ls -l security_test/

cat security_test/secret.txt

sudo chown danny:danny security_test/secret.txt

ls -l security_test/

cat security_test/secret.txt
