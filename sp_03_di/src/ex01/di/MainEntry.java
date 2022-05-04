package ex01.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainEntry {
	public static void main(String[] args) {
		
//		MessageBeanImpl mb = new MessageBeanImpl("yuna", "Hello");
//		mb.sayHello();
//		mb.setGreeting("gigi");
		
		ApplicationContext context = 
				new ClassPathXmlApplicationContext("ex01/di/applicationContext.xml");
		MessageBean bean = (MessageBean)context.getBean("messageBeanImpl");
		bean.sayHello();
	}
}
