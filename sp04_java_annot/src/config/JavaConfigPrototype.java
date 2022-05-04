package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Scope;

import spring.Client2;

@Configuration // xml 설정파일 역할
public class JavaConfigPrototype { // Client1과 다르게 implements로 실행,소멸메소드 2개를 사용하지 않았으므로 설정해줌
	
	@Bean(initMethod="connect", destroyMethod="close") // 시작메소드, 소멸메소드 설정
	@Scope("prototype") // 객체가 각각 메모리를 잡음
	public Client2 client2() {
		Client2 client2 = new Client2();
		client2.setHost("서버222");
		
		return client2;
	}
}
