FROM alpine:3.6
#FROM openjdk:8-jre-alpine

#RUN apt-get install cronie


USER root

RUN apk update && apk add bash
RUN apk add openjdk8
ADD java-version-cron /temp/java-version-cron
RUN chmod 777 /etc/


ADD scheduler.jar /etc/
RUN cat /temp/java-version-cron >> /etc/crontabs/root
RUN rm /temp/java-version-cron

RUN touch /var/log/cron.log

CMD crond 2>&1  >/dev/null && tail -f /var/log/cron.log



# copy crontabs for root user
#COPY hello-cron  /etc/crontabs/root
#COPY abc.sh  /etc/crontabs/abc.sh
#COPY target/scheduler.jar /etc/crontabs


# start crond with log level 8 in foreground, output to stderr
#CMD ["crond", "-f", "-d", "8"]

