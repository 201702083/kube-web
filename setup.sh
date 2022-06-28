
# Web UI yaml apply
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.4.0/aio/deploy/recommended.yaml

# Cluster-admin role yaml apply
kubectl apply -f ./kubernetes-dashboard-service-account.yaml

# Copy token secret
kubectl -n kube-system describe secret \
$(kubectl -n kube-system get secret | grep admin-user | awk '{print $1}') \
| grep token: | awk '{print $2}' | pbcopy

# Open browser 
open http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/ 
