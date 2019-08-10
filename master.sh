#!/bin/bash

# Initialize Kubernetes
echo "[TASK 1] Initialize Kubernetes Cluster"
kubeadm init --apiserver-advertise-address=172.17.0.0 --pod-network-cidr=10.244.0.0/16 >> /root/kubeinit.log 2>/dev/null
#for flannel we shud use this CIDR only

# Copy Kube admin config
echo "[TASK 2] Copy kube admin config to prashant user .kube directory"
mkdir /home/prashant/.kube
cp /etc/kubernetes/admin.conf /home/prashant/.kube/config
chown -R prashant:prashant /home/prashant/.kube

# Deploy flannel network
echo "[TASK 3] Deploy flannel network"
su - prashant -c "kubectl create -f /prashant/kube-flannel.yml"

# Generate Cluster join command
echo "[TASK 4] Generate and save cluster join command to /joincluster.sh"
kubeadm token create --print-join-command > /tmp/joincluster.sh