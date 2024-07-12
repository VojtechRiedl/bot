package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;

public class Main {
    public static void main(String[] args) throws InterruptedException {

        JDA jda = JDABuilder.createDefault("")
                .build();

        // optionally block until JDA is ready
        jda.awaitReady();

    }
}