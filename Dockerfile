# Maven build stage
FROM maven:3.8.1-openjdk-11-slim AS builder

# Set working directory
WORKDIR /app

# Clone Git repository
RUN git clone https://github.com/yourusername/yourrepository.git /app

# Resolve dependencies
RUN mvn -e -B dependency:resolve

# Package the application
RUN mvn clean -e -B packagekage