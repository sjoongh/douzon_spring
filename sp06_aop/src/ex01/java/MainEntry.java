package ex01.java;

public class MainEntry {
	
	public static void main(String[] args) {
		Calc c = new Calc();
		
		System.out.println(c.add(3, 4));
		System.out.println(c.add(100, 50));
		System.out.println();
		
		System.out.println(c.mul(3, 5,1));
		System.out.println(c.mul(10, 20,2));
		
	}
}
