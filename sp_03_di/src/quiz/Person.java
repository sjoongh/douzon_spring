package quiz;

public class Person {
	private String name;
    private int age;
    private boolean gender;
    private boolean isStudent;

    public Person() {

    }

    public Person(String name, int age, boolean gender, boolean isStudent) {

        this.name = name;
        this.age = age;
        this.gender = gender;
        this.isStudent = isStudent;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public boolean isGender() {
        return gender;
    }

    public void setGender(boolean gender) {
        this.gender = gender;
    }

    public boolean isStudent() {
        return isStudent;
    }

    public void setStudent(boolean isStudent) {
        this.isStudent = isStudent;
    }
}
