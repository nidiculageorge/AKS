

Internal Ingress

helm install ingress-nginx ingress-nginx/ingress-nginx --namespace nginx-intingress --set controller.replicaCount=2 --set controller.nodeSelector."kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux --set controller.service.internal.enabled=true --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="true" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal-subnet"="akssubnet" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/readyz --version 4.9.0

helm uninstall ingress-nginx -n nginx-intingress

Internal Ingress with class
-------------------------------


helm install ingress-nginx ingress-nginx/ingress-nginx --namespace nginx-intingress --set controller.replicaCount=2 --set controller.nodeSelector."kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux --set controller.service.internal.enabled=true --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="true" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal-subnet"="akssubnet" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/readyz --set controller.ingressClassResource.name=nginx-internal --set controller.ingressClass=nginx-internal --version 4.9.0



External Ingress

helm install nginx-extingress ingress-nginx/ingress-nginx --namespace nginx-extingress --set controller.replicaCount=2 --set controller.nodeSelector."kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux --set controller.service.type=LoadBalancer --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="false" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/readyz --set controller.ingressClassResource.name=nginx-external --set controller.ingressClass=nginx-external --version 4.9.0 


helm uninstall nginx-extingress -n nginx-extingress


External Ingress without class
-------------------------------

helm install nginx-extingress ingress-nginx/ingress-nginx --namespace nginx-extingress --set controller.replicaCount=2 --set controller.nodeSelector."kubernetes\.io/os"=linux --set defaultBackend.nodeSelector."kubernetes\.io/os"=linux --set controller.admissionWebhooks.patch.nodeSelector."kubernetes\.io/os"=linux --set controller.service.type=LoadBalancer --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-internal"="false" --set controller.service.annotations."service\.beta\.kubernetes\.io/azure-load-balancer-health-probe-request-path"=/readyz --version 4.9.0





