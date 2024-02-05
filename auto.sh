#!/bin/bash

tag1=`sed -n '7p' pom.xml | awk -F ">" '{print $2}'|awk -F "-" '{print $1}'`
docker version
docker build -t container548/hello .
docker tag container548/hello container548/hello:$tag1
docker push container548/hello:$tag1
sed -i "s/latest/$tag1/g" deployment.yml
