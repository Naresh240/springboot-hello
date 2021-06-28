FROM java:8
MAINTAINER Naresh Babu Kamani
ADD ./target/gs-spring-boot-0.1.0.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]