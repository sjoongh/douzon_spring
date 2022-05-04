package quiz;

public class Grade {
	private String name;
    private int music;
    private int art;
    private int athletic;

    public Grade() {
    }

    public Grade(String name, int music, int art, int athletic) {
        this.name = name;
        this.music = music;
        this.art = art;
        this.athletic = athletic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getMusic() {
        return music;
    }

    public void setMusic(int music) {
        this.music = music;
    }

    public int getArt() {
        return art;
    }

    public void setArt(int art) {
        this.art = art;
    }

    public int getAthletic() {
        return athletic;
    }

    public void setAthletic(int athletic) {
        this.athletic = athletic;
    }
}
