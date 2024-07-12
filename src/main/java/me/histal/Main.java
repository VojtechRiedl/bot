package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;

import javax.swing.*;

public class Main {
    public static void main(String[] args) throws InterruptedException {
    String token =  System.getenv("TOKEN");
        System.out.println(token);

        JDA jda = JDABuilder.createDefault(token)
                .build();

        // optionally block until JDA is ready
        jda.awaitReady();

    }
}