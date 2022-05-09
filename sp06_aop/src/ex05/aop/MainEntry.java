package ex05.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

public class MainEntry {
	public static void main(String[] args) {
		
		ApplicationContext  ctx = 
				new GenericXmlApplicationContext("classpath:ex05/aop/appCtx.xml");
		
		ICalc  proxyCal = (ICalc)ctx.getBean("proxy");
		
		//System.out.println(proxyCal.add(22, 33));
		System.out.println(proxyCal.mul(3, 5));
	}
}
