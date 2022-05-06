package ex01.di.annot;

public class Cats {
	
	private MyCats myCats;

	public Cats(MyCats myCats) {
		super();
		this.myCats = myCats;
	}

	public void setMyCatsInfo(MyCats myCats) {
		this.myCats = myCats;
	}
	
	public void getMyCatsinfo() {
		System.out.println("======================");
		System.out.println("cats Name: " + myCats.getName());
		System.out.println("cats Age: " + myCats.getAge());
		System.out.println("cats Hobby: " + myCats.getHobbys());
		System.out.println("cats Weight: " + myCats.getWeight());
		System.out.println("cats Color: " + myCats.getColor());
		
		System.out.println("======================");
	}
	
}
