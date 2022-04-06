Run minikube
- minikube start

Install argocd
- kubectl create namespace argocd
- kubens argocd
- kubectl apply -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
- kubectl patch svc argocd-server -p '{"spec": {"type": "LoadBalancer"}}'
- kubectl port-forward svc/argocd-server 8080:443

In other terminal
- kubectl get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
- open localhost:8080, username is admin, password is V831MFtGmGuGPSQr

Apply our first app
- kubectl apply -f applications-2/guestbook.yaml

Create workflow for build and push to ghcr
- https://docs.github.com/en/actions/publishing-packages/publishing-docker-images

Create a PAT for k8s to pull image
- https://cloud.redhat.com/blog/how-to-use-argocd-deployments-with-github-tokens

Create a secret for k8s to pull image from ghcr
- https://dev.to/asizikov/using-github-container-registry-with-kubernetes-38fb

TEST:
- test world update strategy digest in argocd image updater. should work for latest digest on master branch
- one more test
- one more test
- one more test