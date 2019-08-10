# k8s-GuestBook

K8s cluster setup:
1) Spin up 2 VMs with ip's in cloud:
172.17.0.0
172.17.0.1
2) git clone https://github.com/avsprashant/k8s-GuestBook.git in both VM's
3) Run initial-setup.sh in both VM's.

Check if k8s cluster is up or not:
kubectl config

Deployment:
1) kubectl create -f ./nginx-ingress-controller.yml
This deploys default backend, ingress services
2) kubectl get services -o wide | grep nginx
get the ELB hostname
3) kubectl apply -f Namespaces.yaml
4) kubectl apply -f guestbook-all-in-one.yaml --namespace=staging && kubectl apply -f guestbook-all-in-one.yaml --namespace=production
This deploys in stag and prod namespaces.
