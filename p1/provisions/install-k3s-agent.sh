#!/bin/sh
export K3S_TOKEN_FILE="/vagrant/token"
export K3S_URL="https://192.168.56.110:6443"
curl -sfL https://get.k3s.io | sh -s - agent #--write-kubeconfig-mode=644
