package ex04.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainEntry {
	public static void main(String[] args) {
		
		ApplicationContext  context = new ClassPathXmlApplicationContext("ex04/aop/ctx.xml");
		
		IMessageBean  bean = context.getBean("messageBeanImpl", IMessageBean.class);
		bean.sayHello();
		System.out.println("---------------------------------");
		bean.engHello();
		System.out.println("\n\n==========================");
		IBookBean book = (IBookBean) context.getBean("bookBeanImpl");
		book.testHello(" douzone222");
		book.korHello();
	}
}
