# Create k3d cluster
k3d cluster create -p "8080:443@loadbalancer" iot-part-3

# Wait for cluster to be available
until kubectl version &> /dev/null; do
	sleep 5
done

# Setup argo CD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml -f argocd-ingress.yaml

# Output password (very much secure (changeme))
echo "Password: " $(kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d)