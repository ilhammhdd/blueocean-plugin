#! /bin/bash
podman build -f Containerfile.alpine_arm64v8 -t ilhammhdd/blueocean:latest-alpine-arm64v8
podman run \
  -it \
  --name ilhammhdd_jenkins_blueocean \
  --rm \
  --detach \
  --privileged \
  -p 8080:8080 \
  -p 50000:50000 \
  -v jenkins-data:/var/jenkins_home \
  -v jenkins-docker-certs:/certs/client:ro \
  localhost/ilhammhdd/blueocean:latest-alpine-arm64v8
