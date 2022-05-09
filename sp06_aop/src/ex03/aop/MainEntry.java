package ex03.aop;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainEntry {
	public static void main(String[] args) {
		
		String config = "classpath:ex03/aop/appCtx.xml";
		
		// Proxy 만들고 객체를 넘기고 필요한 객체를 생성하는 작업은 이미 xml 설정 파일을 통해서 만들어뒀음
		ApplicationContext  context = new ClassPathXmlApplicationContext(config);
		
		ICalc proxy = context.getBean("proxy", ICalc.class);
		System.out.println(proxy.add(20, 30));
		System.out.println(proxy.sub(1, 2, 3));
		System.out.println(proxy.mul(3, 5));
	}
}
