---

## ✅ Kubernetes Module Usage

Use the following steps to configure access, apply your manifests with Kustomize, and manage deployments:

```bash
# Backup existing kubeconfig
mv ~/.kube/config ~/.kube/config_backup

# Set kubeconfig from Terraform output
terraform output kube_config > ~/.kube/config
chmod 600 ~/.kube/config

# Verify cluster access
kubectl get nodes

# Apply Kustomize manifests
kubectl apply -k ./kube/

# Force restart for backend if it does start before DB
kubectl rollout restart deployment/backend-deploy -n trainer-portal

# Monitor backend deployment rollout
kubectl rollout status deployment/backend-deploy -n trainer-portal

# Check ingress controller pods and services
kubectl get pods,svc -n ingress-nginx

# Get the external IP for ingress access
kubectl get ingress -n trainer-portal
