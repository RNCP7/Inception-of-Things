# Setup argo CD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Waiting for password
until PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' 2> /dev/null); do
    echo "waiting for password"
	sleep 5
done

# Reconfigure cmd-params config map
kubectl apply -f argocd-cmd-params-cm.yaml
kubectl delete -n argocd $(kubectl get po -n argocd --selector=app.kubernetes.io/name=argocd-server -o name)

kubectl apply -n argocd -f argocd-ingress.yaml

kubectl apply -n argocd -f argocd-application.yaml
# Output password (very much secure (changeme))
echo "Password: " $(echo -n $PASSWORD | base64 -d)
