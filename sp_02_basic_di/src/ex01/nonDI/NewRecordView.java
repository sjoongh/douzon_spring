package ex01.nonDI;

public class NewRecordView {

	private NewRecord record;
	
	public NewRecordView(int kor, int eng, int com, int math) {
		record = new NewRecord(kor, eng, math, com);		
	}
	
	public void print() {
		System.out.println("KOR : " + record.getKor() + "ENG : " + record.getEng() + "MATH : " + record.getMath() + "COM : " + record.getCom());
		System.out.println(record.total() +"/"+ record.avg());
	}
}
