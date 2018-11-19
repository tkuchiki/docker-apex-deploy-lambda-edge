docker_tag="tkuchiki/apex-lambda-edge"

build:
	docker build . -t $(docker_tag):latest

push:
	docker push $(docker_tag):latest
