FROM maven:3.9.8-amazoncorretto-17-al2023

# Update package lists and install Git
RUN yum update -y && yum install -y git

# Set the working directory
WORKDIR /app

# Clone the repository with the Discord bot
RUN git clone https://github.com/VojtechRiedl/bot.git .

COPY . /app

# Instalace závislostí Maven projektu
RUN mvn install

# Spuštění Discord botu (pokud je jar soubor ve stejné složce jako Dockerfile)
CMD ["java", "-jar", "target/discord-bot-1.0.jar"]
