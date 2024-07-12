package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

public class Main {
    public static void main(String[] args) throws InterruptedException {

        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream("stack.env")) {
            properties.load(fis);
        } catch (IOException e) {
            e.printStackTrace();
        }

        String token = properties.getProperty("TOKEN");

        JDA jda = JDABuilder.createDefault(token)
                .build();
        // optionally block until JDA is ready
        jda.awaitReady();

    }
}