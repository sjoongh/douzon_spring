package ex03.di;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainEntry {

	public static void main(String[] args) {
		
		ApplicationContext ctx = new ClassPathXmlApplicationContext("ex03/di/playCtx.xml");
		
		// 직접 접근
//		ctx.getBean("curling", Curling.class);
		// 부모로 들어가기
		Player player = ctx.getBean("curling", Curling.class);
		player.info();
		
		player = ctx.getBean("soccer", Soccer.class);
		player.info();
	}
}
