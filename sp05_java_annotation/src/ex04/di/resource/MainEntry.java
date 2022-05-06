package ex04.di.resource;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainEntry {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new GenericXmlApplicationContext("ex04/di/resource/appCtx.xml");
		
		MonitorViewer viewer = ctx.getBean("monitorViewer", MonitorViewer.class);
	}

}
