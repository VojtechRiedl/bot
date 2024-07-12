package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.swing.*;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        String token =  System.getenv("TOKEN");

        Logger logger = LoggerFactory.getLogger(Main.class);

        java.util.logging.Logger.getAnonymousLogger().info("token" + token);

        java.util.logging.Logger.getAnonymousLogger().info(System.getenv("PATH"));

        java.util.logging.Logger.getAnonymousLogger().info(System.getenv("JAVA_HOME"));

        java.util.logging.Logger.getAnonymousLogger().info(System.getenv("MAVEN_CONFIG"));

        logger.error("token" + token);
        logger.error(System.getenv("PATH"));
        logger.error(System.getenv("JAVA_HOME"));
        // Loop through all environment variables

        JDA jda = JDABuilder.createDefault(token)
                .build();
        // optionally block until JDA is ready
        jda.awaitReady();

    }
}