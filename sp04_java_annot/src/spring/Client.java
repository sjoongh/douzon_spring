package spring;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;

// InitializingBean, DisposableBean를 implements하지 않아도 내부적으로 돌아가고 있음
public class Client implements InitializingBean, DisposableBean {
	
	public Client() {
		System.out.println("Client Default Constructor");
	}
	
	private String defaulthost;
	
	public Client(String defaulthost) {
		this.defaulthost = defaulthost;
		System.out.println("Client 생성자 : "+this.defaulthost);
	}
	
	private String host;
	
	public void setHost(String host) {
		this.host = host;
	}
	
	// 초기화 메서드(event를 내부적으로 가지고 자동 호출 : 호출시점)
	// InitializingBean 대한 구현부
	// afterPropertiesSet : property injection 후에
	@Override
	public void afterPropertiesSet() throws Exception {
		System.out.println("Client.afterPropertiesSet() 실행");

	}
	
	// afterPropertiesSet가 자동호출 되지만 초기화메서드를 connect처럼 사용자가 지정할 수 있음
	public void connect() throws Exception {
		System.out.println("Client.connect() 실행");
	}
	
	public void send() { // <property> 역할
		System.out.println("Client.send() to : "+host);
	}

	// 소멸 메서드(이벤트를 내부적으로 가지고 자동 호출 : 호출시점)
	// DisposableBean에 대한 구현부
	@Override
	public void destroy() throws Exception { // ctx.close() 역할
		System.out.println("Client.destroy() 실행");

	}

}
