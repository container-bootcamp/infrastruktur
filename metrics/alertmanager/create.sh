#!/bin/bash

kubectl apply -f alertmanager-deploy.yaml
kubectl -n metrics create secret generic alertmanager-main --from-file=alertmanager.yaml