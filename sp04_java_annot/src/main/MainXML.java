package main;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

import spring.Client;
import spring.Client2;

public class MainXML {

	public static void main(String[] args) {
		GenericXmlApplicationContext context = new GenericXmlApplicationContext(
				new String[] {"appCtx.xml", "appCtx2.xml"});
		
//		ApplicationContext context = new ClassPathXmlApplicationContext(
//				new String[] {"appCtx.xml", "appCtx2.xml"});
		
		Client c1 = (Client) context.getBean("client");
//		Client2 c2 = (Client2) context.getBean("client2", Client2.class);
		Client c2 = (Client) context.getBean("client2");
		
		c1.send();
		c1.setHost("1111");
		System.out.println("---------------");
		c2.send();
		c2.setHost("222");
	}

}
