# spring-boot-hello

## Pre-requisites:

```bash
- Install Java
- Install GIT
- Install Maven
```

## Clone code from github:

```bash
git clone https://github.com/Naresh240/springboot-hello.git
cd pring-boot-hello
```

## Build Maven Artifact:

```bash
mvn clean install
```

## Deploy springboot application:

```bash
java -jar gs-spring-boot-0.1.0.jar
```

## If you want to run ```Dockerfile-with-ARG-ENV file```

```bash
docker build -t springboothello:v1 -f Dockerfile-with-ARG-ENV . --build-arg version=0.1.0
```
