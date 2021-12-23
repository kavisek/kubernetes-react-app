CONTAINER_NAME = react_hello_world
PROJECT_ID = kavi-prod-gke-demo

npm_run:
	npm start

npm_build:
	npm run-script build


# DOCKER COMMANDS

.PHONY:build
build:
	docker build -f "Dockerfile" -t ${CONTAINER_NAME}:dev .

.PHONY: run
run: build
	docker run --name ${CONTAINER_NAME} -p 3000:3000 -it ${CONTAINER_NAME}:dev 

.PHONY: exec
exec: build
	docker run --entrypoint /bin/bash --name ${CONTAINER_NAME} -it ${CONTAINER_NAME}:dev 



yo:
	echo yo