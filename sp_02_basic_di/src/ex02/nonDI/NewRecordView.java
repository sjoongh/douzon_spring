package ex02.nonDI;

public class NewRecordView {

	private NewRecord record;
	
	// 필요한 객체를 [SETTER] method를 통해서 주입 받아서 사용
	// 객체의 생성이 서로 독립적이고 필요시 객체에 주입
	
	public void setRecord(NewRecord record) {
		this.record = record;
	}
	
	public void print() {
		System.out.println("KOR : " + record.getKor() + "ENG : " + record.getEng() + "MATH : " + record.getMath() + "COM : " + record.getCom());
		System.out.println(record.total() +"/"+ record.avg());
	}
}
