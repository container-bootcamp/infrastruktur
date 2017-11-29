#/bin/bash

: ${1?Please provide a password}

htpasswd -b -c auth bootcamp $1
kubectl -n bibliothek create secret generic basic-auth --from-file=auth
kubectl -n ci create secret generic basic-auth --from-file=auth

rm auth