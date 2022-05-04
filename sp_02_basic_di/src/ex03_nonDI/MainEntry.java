package ex03_nonDI;

public class MainEntry {
	public static void main(String[] args) {
		
		// IRecord record = new NewRecordImpl(); --> 부모객체를 이용해서 자식객체로
		NewRecordImpl record = new NewRecordImpl();
		// IRecordView view = new NewRecordViewImpl();
		NewRecordViewImpl view = new NewRecordViewImpl();
		
		// 조립
		view.setRecord(record);
		view.input();
		view.print();
	}
}
