this Docker container should set up a development environment for the timeweb application

first, you should pull the image from Docker Hub

docker pull drewbiec/timeweb-dev:latest


then, you can run the container

docker run -it -p 8080:5000 drewbiec/timeweb-dev

