#Uninstall the kubeocst-cloud

helm uninstall kubecost-cloud -n kubecost-cloud

#AD Integration

#https://docs.kubecost.com/install-and-configure/advanced-configuration/user-management-saml/microsoft-entra-id-saml-integration-for-kubecost

kubectl create secret generic kubecost-azuread --from-file myservice.cert --namespace kubecost-ns

#Installing Kube Cost from values-rm.yml

helm install kubecost cost-analyzer --repo https://kubecost.github.io/cost-analyzer/ --namespace kubecost-ns --create-namespace --values values-rm.yml


#Updating the license

helm upgrade -i kubecost cost-analyzer --repo https://kubecost.github.io/cost-analyzer/ --namespace kubecost-ns --create-namespace --values values-rm.yml



