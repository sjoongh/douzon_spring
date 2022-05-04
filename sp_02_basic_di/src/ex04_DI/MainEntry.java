package ex04_DI;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainEntry {

	public static void main(String[] args) {
		
//		ApplicationContext context = new ClassPathXmlApplicationContext("ex04/di/appCtx.xml");
		ApplicationContext context = new ClassPathXmlApplicationContext(new String[] {appCtx.xml, textCtx.xml});
		// NewRecordViewImpl view = context.getBean("view");
		context.getBean("view");
		
	}

}
