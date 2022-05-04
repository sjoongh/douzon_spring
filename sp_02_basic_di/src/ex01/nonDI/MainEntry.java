package ex01.nonDI;

public class MainEntry {

	public static void main(String[] args) {
		
		// is-a,	has-a
		// 상속		포함관계
		// has-a 관계를 통해서 객체 다루기
		
		NewRecordView view = new NewRecordView(1, 2, 3, 4);
		
		view.print();
	}

}
