package ex04.aop;

public class BookBeanImpl implements IBookBean {

	@Override
	public void testHello(String str) {
		System.out.println("public void testHello(String str)  call~" + str);
	}

	@Override
	public int korHello() {
		System.out.println("public int korHello()  call~~");
		
		return 5;
	}

}
