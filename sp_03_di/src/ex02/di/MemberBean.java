package ex02.di;

public class MemberBean {
	
	private String name;
	private int age;
	private String message;
	
	// constructor
	public MemberBean() {
		System.out.println("Member 기본 생성자");
	}

	public MemberBean(String name, int age, String message) {
		super();
		this.name = name;
		this.age = age;
		this.message = message;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	
}
