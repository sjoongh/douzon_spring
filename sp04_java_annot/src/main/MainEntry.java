package main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.JavaConfig;
import spring.Client;

public class MainEntry {

	public static void main(String[] args) {

		AnnotationConfigApplicationContext ctx = 
				new AnnotationConfigApplicationContext(JavaConfig.class);
		
		Client c = ctx.getBean("client", Client.class);
		Client c2 = ctx.getBean("client", Client.class);
		
		// Spring은 싱글톤 패턴임
		System.out.println(c.hashCode());
		System.out.println(c2.hashCode());
		c.setHost("서버야");
		ctx.close();
	}

}
