FROM maven:3.5.2-jdk-9 AS build  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package


FROM registry.access.redhat.com/ubi7-minimal
USER root

RUN microdnf install java-1.8.0-openjdk-headless --nodocs && microdnf clean all

# Set the JAVA_HOME variable to make it clear where Java is located
ENV JAVA_HOME /etc/alternatives/jre
ENV PATH $PATH:$JAVA_HOME/bin

# Dir for my app
RUN mkdir -p /app

# Expose port to listen to
EXPOSE 8080 8081

ENV _JAVA_OPTIONS "-Xms256m -Xmx512m -Djava.awt.headless=true"

COPY --from=build /usr/src/app/target/scheduler-service.jar /usr/app/scheduler-service.jar  

ENTRYPOINT ["java", "-jar", "/usr/app/scheduler-service.jar"]


