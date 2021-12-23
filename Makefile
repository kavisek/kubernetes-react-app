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
	kubectl apply -f kubernetes/react_deploy.yml -n react
	kubectl apply -f kubernetes/react_svc.yml -n react
	kubectl apply -f kubernetes/react_configmap.yml -n react

k8s_delete:
	kubectl delete -f kubernetes/react_deploy.yml -n react
	kubectl delete -f kubernetes/react_svc.yml -n react
	kubectl delete -f kubernetes/react_configmap.yml -n react

# KUBERNETES DEPLOYMENT COMMAND

k8s_exec:
	kubectl exec --stdin --tty -- /bin/bash