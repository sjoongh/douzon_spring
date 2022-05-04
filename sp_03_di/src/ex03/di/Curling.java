package ex03.di;

public class Curling implements Player {
	
	private String name, position, sport;

	@Override
	public void info() {
		System.out.println("선수 정보");
		System.out.println("name : "+this.name);
		System.out.println("position : "+this.position);
		System.out.println("sport : "+this.sport);
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public void setSport(String sport) {
		this.sport = sport;
	}
	
}
