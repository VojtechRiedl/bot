package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.swing.*;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws InterruptedException {
    String token =  System.getenv("OS");
        Map<String, String> env_var = System.getenv();
        Logger logger = LoggerFactory.getLogger(Main.class);

        // Loop through all environment variables
        for (String envName : env_var.keySet()) {

            logger.info("envName: " + envName + " env_var: " + env_var.get(envName));
            // Print environment variable name and value to console
        }
    System.out.println(token);

    JDA jda = JDABuilder.createDefault(token)
            .build();
    // optionally block until JDA is ready
    jda.awaitReady();

    }
}