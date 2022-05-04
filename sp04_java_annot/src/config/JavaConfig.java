package config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import spring.Client;

@Configuration // 설정 파일임을 알려준다.
public class JavaConfig { // XML 기반 설정이 아닌 자바 기반 설정
	
	// Bean이라는 것을 명시해야함, 기존의 xml에서 설정해주던 Bean설정
	@Bean
	public Client client() { // 이 자체가 Bean으로 설정
		Client client = new Client();
		client.setHost("server!!!");
		
		return client;
	}
}
