# Použijeme oficiální OpenJDK obraz jako základ
FROM openjdk:11-jre-slim

# Pracovní adresář ve výchozím kontextu
WORKDIR /app

RUN apt-get update && apt-get install -y git

# Naklonování repozitáře s Discord botem
RUN git clone https://github.com/VojtechRiedl/bot.git .

# Spuštění Discord botu (pokud je jar soubor ve stejné složce jako Dockerfile)
CMD ["java", "-jar", "discord.jar"]