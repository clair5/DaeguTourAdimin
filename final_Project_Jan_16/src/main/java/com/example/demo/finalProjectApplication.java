package com.example.demo;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.ComponentScan;


@SpringBootApplication
@ComponentScan
public class finalProjectApplication {

	public static void main(String[] args) {
		SpringApplication.run(finalProjectApplication.class, args);
	}

}
