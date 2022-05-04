package ex01.di;

public class MessageBeanImpl implements MessageBean {

	private String name, greeting;
	
	// 1. constructor <--- DI
	public MessageBeanImpl() {}
	public MessageBeanImpl(String name, String greeting) {
		super();
		this.name = name;
		this.greeting = greeting;
	}
	
	// 2. setter method 이용
	public void setName(String name) {
		this.name = name;
	}
	public void setGreeting(String greeting) {
		this.greeting = greeting;
	}

	@Override
	public void sayHello() {
		System.out.println(greeting + " / " + name);
	}
}
