#!/bin/sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--flannel-backend none --token 12345" sudo sh -s -
