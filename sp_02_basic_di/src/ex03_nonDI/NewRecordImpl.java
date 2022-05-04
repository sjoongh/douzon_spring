package ex03_nonDI;

public class NewRecordImpl implements IRecord {
	private int kor, eng, com;
	
	
	public int getKor() {
		return kor;
	}

	public void setKor(int kor) {
		this.kor = kor;
	}

	public int getEng() {
		return eng;
	}

	public void setEng(int eng) {
		this.eng = eng;
	}

	public int getCom() {
		return com;
	}

	public void setCom(int com) {
		this.com = com;
	}

	public NewRecordImpl() {
		this(0, 0, 0);
	}

	public NewRecordImpl(int kor, int eng, int com) {
		super();
		this.kor = kor;
		this.eng = eng;
		this.com = com;
	}

	@Override
	public int total() {
		return this.kor + this.eng + this.com;
	}

	@Override
	public float avg() {
		return total() / 3.0f;
	}
	
	
	
	
	
}
