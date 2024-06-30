# Use an official Maven image as the base image
FROM maven:3.8.4-openjdk-11-slim AS build

# Set the working directory in the container
WORKDIR /app

# Clone the Java application from GitHub
RUN apt-get update && apt-get install -y git
RUN git clone https://github.com/VojtechRiedl/bot.git .

# Build the application using Maven
RUN mvn clean package -DskipTests

# Use an official OpenJDK image as the base image for runtime
FROM openjdk:11-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the built JAR file from the previous stage to the container
COPY --from=build /app/target/discord-bot-1.0.jar .

# Set the command to run the application
CMD ["java", "-jar", "discord-bot-1.0.jar"]