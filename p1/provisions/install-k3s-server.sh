#!/bin/sh
curl -sfL https://get.k3s.io | sudo sh -s -

until TOKEN=$(sudo k3s token create --ttl 2m); do
	sleep 5
done
sudo echo $TOKEN > /vagrant/token
