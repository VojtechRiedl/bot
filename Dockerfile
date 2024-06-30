# Použijeme oficiální Maven obraz jako základ
FROM maven:3.8.5-openjdk-17

# Nastavíme pracovní adresář v kontejneru
WORKDIR /app

# Stáhneme projekt z GitHubu
RUN git clone https://github.com/VojtechRiedl/bot.git

# Sestavíme projekt pomocí Mavenu
RUN mvn clean package

# Nastavíme vstupní bod pro spuštění aplikace
ENTRYPOINT ["java", "-cp", "target/classes", "com.example.Main"]