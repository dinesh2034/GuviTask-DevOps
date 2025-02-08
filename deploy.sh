#!/bin/bash
echo hi123
chmod +x build.sh
./build.sh

# Use non-interactive login
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin

# Tag and push the image
docker tag test-image sridinesh/service-tag
docker push sridinesh/service-tag  

docker pull sreevadhani/service-tag
docker run -d -p 8000:80 --name=my-service-repo sreevadhani/service-tag
