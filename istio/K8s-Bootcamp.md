
* kubectl apply  -f install/kubernetes/istio.yaml
* for ingress with basic auth
  * kubectl -n bibliothek get secret basic-auth -o json | jq '.metadata.namespace = "istio-system"' | kubectl apply -f -
  * kubectl apply  -f install/kubernetes/bootcamp-ingress.yaml

kubectl create ns bookinfo
kubectl -n bookinfo apply -f <(istioctl kube-inject -f samples/bookinfo/kube/bookinfo.yaml)

# 4 prometheus
kubectl apply -f install/kubernetes/addons/service-monitors.yaml

# 4 Service Graph
- kubectl apply -f install/kubernetes/addons/servicegraph.yaml
- kubectl -n istio-system port-forward $(kubectl -n istio-system get pod -l app=servicegraph -o jsonpath='{.items[0].metadata.name}') 8088:8088
- browse to http://localhost:8088/dotviz