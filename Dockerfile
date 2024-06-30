# Use an official OpenJDK image as the base image
FROM openjdk:11-jdk

# Install Git and Maven
RUN apt-get update
RUN apt-get install -y maven

# Clone the Java application from GitHub
RUN git clone https://github.com/VojtechRiedl/bot.git /usr/local/service

# Set the working directory to the cloned repository
WORKDIR /usr/local/service

# Build the application using Maven
RUN mvn package

# Set the command to run the application
CMD ["java", "-jar", "target/docker-service-1.0-SNAPSHOT-jar-with-dependencies.jar"]