# spring-boot-hello:

# Pre-requisites:
  - Install Java
  - Install GIT
  - Install Maven
  - Install Docker
  
# Clone code from github:
    git clone https://github.com/Naresh240/springboot-hello.git
    cd springboot-hello
# Build Maven Artifact:
    mvn clean install
# Build Docker image for Springboot Application:
    docker build -t naresh240/springboot-hello:latest .
# Docker login:
    docker login
# Push docker image to dockerhub:
    docker push naresh240/springboot-hello:latest
# Deploy Springboot Application as Container:
    docker run --name springboot-container -p 8080:8080 -d naresh240/springboot-hello:latest
