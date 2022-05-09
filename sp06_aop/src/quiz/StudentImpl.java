package quiz;


public class StudentImpl implements StudentBean {
	
	@Override
	public void print(String name, String grade, String gender) {
		System.out.println("public void testHello(String str)  call~" + name + grade + gender);
	}

}
