# Start with a base image containing Java runtime
FROM adoptopenjdk/openjdk11:alpine-jre

# Add Maintainer Info
LABEL maintainer="awenwhy@gmail.com"

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 39100

# The application's jar file
ARG JAR_FILE=build/libs/organization-1.0.0-SNAPSHOT.jar

# Add the application's jar to the container
ADD ${JAR_FILE} app.jar

# Run the jar file
ENTRYPOINT ["java","-jar","app.jar"]