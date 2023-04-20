FROM maven:3.6.0-jdk-8-slim AS build
#COPY src /home/app/src
#COPY pom.xml /home/app
# COPY settings.xml /root/.m2/settings.xml
# COPY com/ /root/.m2/repository/com
#RUN mvn -f /home/app/pom.xml clean package

#
# Package stage
#
FROM openjdk:8-jre-slim
# Set the time zone for the container
ENV TZ=Asia/Kolkata
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

COPY /target/demo12-0.0.1-SNAPSHOT.jar /home/app.jar
#COPY --from=build /home/app/src/main/resources/application.properties /home/application.properties
EXPOSE 8080
#RUN useradd -u 8877 none
#USER none
#CMD java -jar /home/app.jar
COPY /src/main/resources/application.properties /home/application.properties
CMD java -jar /home/app.jar --spring.config.location=file:/home/application.properties
