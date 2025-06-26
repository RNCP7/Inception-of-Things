#!/bin/sh
curl -sfL https://get.k3s.io | sudo sh -s - --write-kubeconfig-mode=644

until kubectl version &> /dev/null; do
	sleep 5
done
k3s token create --ttl 2m > /vagrant/token
