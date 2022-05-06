package ex02.di.annotation;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainEntry {

	public static void main(String[] args) {
		
		ApplicationContext context = 
				new GenericXmlApplicationContext("ex02/di/autowired/applicationContext.xml");
		
		MonitorViewer viewer = context.getBean("monitorViewer", MonitorViewer.class);
		System.out.println(viewer.getRecorder().toString());
	}

}
