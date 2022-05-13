package edu.kosa.model;

public class GuestDTO { // Model
	
	private int num;
	private String name, email, home, contents;
	
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getHome() {
		return home;
	}
	public void setHome(String home) {
		this.home = home;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	@Override
	public String toString() {
		return "GuestDTO [num=" + num + ", name=" + name + ", email=" + email + ", home=" + home + ", contents="
				+ contents + "]";
	}
	
	
}
