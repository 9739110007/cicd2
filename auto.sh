
#!/bin/bash

# Extracting version from pom.xml
tag1=$(sed -n '7s/.*<version>\(.*\)<\/version>/\1/p' pom.xml | awk -F '-' '{print $1}')

# Display Docker version
docker version

# Build Docker image
docker build -t container548/hello .

# Tag Docker image
docker tag container548/hello container548/hello:"$tag1"

# Push Docker image to registry
docker push container548/hello:"$tag1"

# Update deployment.yml with the new tag
sed -i "s/latest/$tag1/g" deployment.yml
