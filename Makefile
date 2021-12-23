CONTAINER_NAME = react_hello_world
PROJECT_ID = kavi-prod-gke-demo
ZONE=us-central1-c
CLUSTER_NAME = demo-cluster
KUBE_CONTEXT = gke_kavi-prod-gke-demo_us-central1-c_demo-cluster


# GCLOUD COMMANDS

login:
	gcloud auth login
	gcloud auth application-default login
	gcloud auth configure-docker

gke_login:
	gcloud container clusters get-credentials ${} \
	--project ${PROJECT_ID} \
	--zone ${ZONE}


# KUBERNETES COMMANDS

set_context:
	kubectl config set current-context ${KUBE_CONTEXT}
	kubectl config current-context

create_namespace:
	kubect create ns react

watch:
	watch -n 4 kubectl get pods,deploy,svc,nodes -n react


# KUBERNETES DEPLOYMENT COMMAND

k8s_deploy:
	kubectl apply -f kubernetes/react_deploy.yaml -n react
	kubectl apply -f kubernetes/react_svc.yaml -n react
	kubectl apply -f kubernetes/react_configmap.yaml -n react

k8s_delete:
	kubectl delete -f kubernetes/react_deploy.yaml -n react
	kubectl delete -f kubernetes/react_svc.yaml -n react
	kubectl delete -f kubernetes/react_configmap.yaml -n react

# KUBERNETES TROUBLESHOOTING COMMANDS

k8s_exec:
	kubectl exec --stdin --tty -- /bin/bash


# HELM COMMANDS

helm_dry_run:
	helm install react ./react/ \
	--namespace react \
	--values ./react/values.yaml \
	--set configmap.REACT_APP_OWNER=kavi2 \
	--create-namespace \
	--dry-run

helm_install:
	helm install react ./react/ \
	--namespace react \
	--values ./react/values.yaml \
	--set configmap.REACT_APP_OWNER=kavi2 \
	--create-namespace \

helm_uninstall:
	helm uninstall react \
	--namespace react \