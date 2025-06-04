#!/bin/sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server http://192.168.56.110" sh -s -