package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;

import javax.swing.*;
import java.util.Map;

public class Main {
    public static void main(String[] args) throws InterruptedException {
    String token =  System.getenv("OS");
        Map<String, String> env_var = System.getenv();

        // Loop through all environment variables
        for (String envName : env_var.keySet()) {
            // Print environment variable name and value to console
            System.out.format("%s=%s", envName, env_var.get(envName));
            System.out.println();
        }
    System.out.println(token);

    JDA jda = JDABuilder.createDefault(token)
            .build();

    // optionally block until JDA is ready
    jda.awaitReady();

    }
}