CONTAINER_NAME = react_hello_world
PROJECT_ID = kavi-prod-gke-demo

# DOCKER COMMANDS

build:
	docker build -f "Dockerfile" -t ${CONTAINER_NAME}:dev .


run:
	docker run --rm \
	-d \
	-p 5001:5000 \
	--name ${CONTAINER_NAME} -it ${CONTAINER_NAME}:dev


watch:
	watch -n 5 docker container ls


# GCR COMMANDS


push: build
	docker tag ${CONTAINER_NAME}:dev gcr.io/${PROJECT_ID}/${CONTAINER_NAME}:dev
	docker push gcr.io/${PROJECT_ID}/${CONTAINER_NAME}:dev
