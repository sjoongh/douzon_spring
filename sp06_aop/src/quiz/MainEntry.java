package quiz;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


public class MainEntry {

	public static void main(String[] args) {
		
ApplicationContext  context = new ClassPathXmlApplicationContext("quiz/ctx.xml");
		
		StudentBean  bean = context.getBean("StudentImpl", StudentBean.class);
		bean.print("하이", "hello", "안녕");
		System.out.println("---------------------------------");
	}

}
