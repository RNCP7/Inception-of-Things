# Create k3d clustera
k3d cluster create iot-part-3 -p "443:443@loadbalancer" --wait --k3s-arg "--disable=traefik@server:0"

# Setting up traefik
helm repo add traefik https://traefik.github.io/charts
helm install traefik traefik/traefik -n kube-system -f traefik-helm-chart-values.yaml --wait
#kubectl apply -f traefik-helm-chart-values.yaml

# Exec argocd script
exec ./argocd.sh
