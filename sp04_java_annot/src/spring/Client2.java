package spring;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

public class Client2 implements InitializingBean, DisposableBean {
	
	private String host;

	public void setHost(String host) {
		this.host = host;
		System.out.println("Client2.setHost() 호출 : "+host);
	}
	
	public void connect() throws Exception {
		System.out.println("Client.connect() 실행 - 초기화메소드");
	}
	
	public void send() {
		System.out.println("Client2.send() to : "+host);
	}
	
	public void close() throws Exception {
		System.out.println("Client2.close() - 소멸 메소드");
	}

	@Override
	public void destroy() throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterPropertiesSet() throws Exception {
		// TODO Auto-generated method stub
		
	}
}
