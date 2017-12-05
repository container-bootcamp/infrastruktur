#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /tmp/tls.key -out /tmp/tls.crt -subj "/CN=gitlab.bootcamp.ch.innoq.io"
kubectl -n ci create secret tls tls-default --key /tmp/tls.key --cert /tmp/tls.crt