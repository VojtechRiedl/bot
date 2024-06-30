# Použijeme oficiální image OpenJDK pro Javu a Maven
FROM maven:3.8.5-openjdk-11 AS build

# Nastavíme pracovní adresář v kontejneru
WORKDIR /app

# Instalace Gitu
RUN apt-get update && apt-get install -y git

# Naklonujeme zdrojový kód Java aplikace z Gitu
RUN git clone https://github.com/VojtechRiedl/bot.git .

# Buildíme Maven projekt
RUN mvn clean package

# Druhý stage - pouze pro spuštění aplikace
FROM openjdk:11-jre-slim

# Nastavíme pracovní adresář
WORKDIR /app

# Zkopírujeme vygenerovaný JAR soubor z předchozího stage
COPY --from=build /app/target/*.jar app.jar

# Spustíme aplikaci při startu kontejneru
CMD ["java", "-jar", "app.jar"]