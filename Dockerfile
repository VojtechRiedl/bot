# Použijeme oficiální image OpenJDK pro Javu a Maven
FROM maven:3.8.5-openjdk-11 AS build

# Nastavíme pracovní adresář v kontejneru
WORKDIR /app

# Instalace Gitu
RUN apt-get update && apt-get install -y git

# Naklonujeme zdrojový kód Java aplikace z Gitu
RUN git clone <URL_git_repo> .

# Buildíme Maven projekt a nastavíme manifest
RUN mvn clean package \
    && mv target/*.jar app.jar \
    && echo "Main-Class: me.histal.Main" > manifest.txt \
    && jar cmf manifest.txt app.jar

# Druhý stage - pouze pro spuštění aplikace
FROM openjdk:11-jre-slim

# Nastavíme pracovní adresář
WORKDIR /app

# Zkopírujeme vygenerovaný JAR soubor z předchozího stage
COPY --from=build /app/app.jar .

# Spustíme aplikaci při startu kontejneru
CMD ["java", "-jar", "app.jar"]