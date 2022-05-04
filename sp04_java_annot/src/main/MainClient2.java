package main;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.JavaConfigPrototype;
import spring.Client2;

public class MainClient2 {

	public static void main(String[] args) {
		AnnotationConfigApplicationContext ctx = new AnnotationConfigApplicationContext(JavaConfigPrototype.class);
		
		Client2 client = ctx.getBean("client2", Client2.class);
		Client2 client2 = ctx.getBean("client2", Client2.class);
		client.send();
		
		// @Scope("prototype")때문에 각각의 객체가 다른 주소를 가지게됨
		System.out.println(client.hashCode());
		System.out.println(client2.hashCode());
		ctx.close();
	}

}
