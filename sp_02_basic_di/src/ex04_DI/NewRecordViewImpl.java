package ex04_DI;

import java.util.Scanner;

public class NewRecordViewImpl implements IRecordView {

	private NewRecordImpl record;
	
	// setter로 주입하기
	public void setRecord(NewRecordImpl record) { // DI 적용
		this.record = record;
	}
		
	@Override
	public void input() {
		Scanner sc = new Scanner(System.in);
		System.out.print("kor : ");	record.setKor(sc.nextInt());
		System.out.print("eng : ");	record.setEng(sc.nextInt());
		System.out.print("com : ");	record.setCom(sc.nextInt());
		
	}

	@Override
	public void print() {
		System.out.println("\n\nkor : "+record.getKor());
		System.out.println("eng : "+record.getEng());
		System.out.println("com : "+record.getCom());
		
		System.out.println("total : "+record.total() + "\t avg : " + record.avg());
	}

}
