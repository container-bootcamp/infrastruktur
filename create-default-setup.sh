#!/bin/bash

## initial namespace setup and rook
kubectl apply -f namespaces.yaml

## for basic auth if ingress
./create-basic-auth-secret.sh

## the operators
kubectl apply -f operator/

## give operators time to settle things
sleep 30

## Monitoring
kubectl apply -f monitoring/

## metrics stuff
cd metrics/alertmanager/
./create.sh
cd ../..
kubectl apply -f metrics/
kubectl apply -f metrics/grafana-config/

## MongoDB
kubectl apply -f mongodb/

## PostGreSQL
kubectl apply -f postgres-simple/

## Tracing
kubectl apply -f tracing/
