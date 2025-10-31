# Create k3d cluster
k3d cluster create iot-part-3 -p "443:443@loadbalancer"

# Wait for cluster to be available
until kubectl version &> /dev/null; do
	sleep 5
done

exec ./argocd.sh
