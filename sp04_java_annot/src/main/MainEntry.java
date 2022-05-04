package main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.JavaConfig;
import spring.Client;

public class MainEntry {

	public static void main(String[] args) {

		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(JavaConfig.class);
		
		Client c = ctx.getBean("client", Client.class);
		c.setHost("서버야");
		ctx.close();
	}

}
