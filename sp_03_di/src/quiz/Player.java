package quiz;

public class Player {
	private String name;
    private String position;
    private String sports;

    public Player() {
    }

    public Player(String name, String position, String  sports) {
        this.name = name;
        this.position = position;
        this.sports = sports;
    }

    public String getName() {
        return name;
    }

    public String getPosition() {
        return position;
    }

    public String getSports() {
        return sports;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPosition(String position) {
        this.position = position;
    }

    public void setSports(String sports) {
        this.sports = sports;
    }
}
