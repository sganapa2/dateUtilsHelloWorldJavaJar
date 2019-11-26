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
# Copy the MicroProfile starter app
ADD target/scheduler.jar /app/

#RUN echo $JAVA_HOME

ENV _JAVA_OPTIONS "-Xms256m -Xmx512m -Djava.awt.headless=true"

ENTRYPOINT ["java", "-jar", "/app/scheduler.jar"]
