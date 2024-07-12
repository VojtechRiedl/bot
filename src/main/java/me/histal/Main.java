package me.histal;

import net.dv8tion.jda.api.JDA;
import net.dv8tion.jda.api.JDABuilder;

public class Main {
    public static void main(String[] args) throws InterruptedException {
        JDA jda = JDABuilder.createDefault("ODQwNTE3NDU2OTQ1ODcyOTE3.GlHws8.OZ5utPX8Q_Ja1F5D9HQli9LliBMq_eVo7RbdiE\n")
                .build();

        // optionally block until JDA is ready
        jda.awaitReady();
    }
}