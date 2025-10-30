# Create k3d cluster
k3d cluster create iot-part-3

# Wait for cluster to be available
until kubectl version &> /dev/null; do
	sleep 5
done

# Setup argo CD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

until PASSWORD=$(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' 2> /dev/null); do
    echo "waiting for password"
	sleep 5
done

kubectl apply -n argocd -f argocd-application.yaml
# Output password (very much secure (changeme))
echo "Password: " $(echo -n $PASSWORD | base64 -d)
