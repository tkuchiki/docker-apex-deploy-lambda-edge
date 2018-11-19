# docker-apex-deploy-lambda-edge

[![Docker Pulls](https://img.shields.io/docker/pulls/tkuchiki/apex-lambda-edge.svg?style=for-the-badge)](https://hub.docker.com/r/tkuchiki/apex-lambda-edge/)

Not sets environment variables APEX_FUNCTION_NAME and LAMBDA_FUNCTION_NAME when deploys to Lambda@Edge.

```console
$ docker run --rm -v $(pwd):/opt/apex \
    -e AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
    -e AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
    tkuchiki/apex-lambda-edge deploy
```
