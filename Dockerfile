# Use the official Maven image with OpenJDK 17 as base image
FROM maven:3.8.5-openjdk-17 AS build

# Set the working directory in the container
WORKDIR /app

# Clone the project from GitHub (if needed)
RUN git clone https://github.com/VojtechRiedl/bot.git

# Build the application
RUN mvn clean package

# Change working directory to the cloned project
WORKDIR /app

# Stage 2: Use a smaller base image for runtime
FROM openjdk:17-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the compiled artifacts from the build stage
COPY --from=build /app/target/*.jar /app/app.jar

# Specify the command to run your application
ENTRYPOINT ["java", "-jar", "app.jar"]