package com.quest.app;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;

@SpringBootApplication
public class QuestApplication extends SpringBootServletInitializer {
    
        @Override
        protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
            return application.sources(QuestApplication.class);
        }

	public static void main(String[] args) {
            SpringApplication.run(QuestApplication.class, args);
	}
}
