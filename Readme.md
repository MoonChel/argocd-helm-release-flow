Run minikube
- minikube start

Install argocd
- kubectl create namespace argocd
- kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
- kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'
- kubectl port-forward svc/argocd-server -n argocd 8080:443

In other terminal
- kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
- open localhost:8080, username is admin

Apply our first app
- kubectl apply -n argocd -f applications-2/guestbook.yaml
