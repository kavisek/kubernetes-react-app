# kubernetes-react-app

/kubernetes: basic kubernetes deployment
/helm: helm templated manifests
### Development

Start the the development server. VS Code will build the `Dockerfile.dev`

1. Start the dev container in vscode.
2. Start the frontend

```bash
cd hello-world
make run
```

### Docker Run

You can run the container locally with th following command.

```bash
cd hello-world
make run
```

Navigate to http://localhost:3000 to view the results.

### Kubernetes Deployments

Once you have the gke cluster up and running. Use the following commands to runs to deploy the k8s manifests.

### Kubernetes Deployments

1. Connect to the Cluster

```bash
make gke_login
```

2. Create a namespace for the application

```bash
# Create namespace
kubect create ns react
```

3. You can deploy the react container on kubernetes via deployment, service, and configmap manifests.

```bash
# Deploy (kubectl apply)
make k8s_deploy
```
Check the external ip address for react service with `kubectl get svc -n react` on port `3000` to view your application.

4. Remove the application with a similar command.

```bash
# Deploy (kubectl delete)
make k8s_delete
```