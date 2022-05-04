package quiz;

import java.util.Scanner;

public class GradeServiceImp implements calService, IOService {

	private Grade grade;

    public void setGrade(Grade grade) {
        this.grade = grade;
    }

    @Override
    public void print() {
        System.out.println("\n");
        System.out.println("이름 : " + grade.getName());
        System.out.println("음악 : " + grade.getMusic());
        System.out.println("미술 : " + grade.getArt());
        System.out.println("체육 : " + grade.getAthletic());
        System.out.println("총점 : " + total());
        System.out.println("평균 : " + avg());

    }

    @Override
    public void input() {
        Scanner sc = new Scanner(System.in);
        System.out.print("이름 : ");
        grade.setName(sc.next());
        System.out.print("음악 : ");
        grade.setMusic(sc.nextInt());
        System.out.print("미술 : ");
        grade.setArt(sc.nextInt());
        System.out.print("체육 : ");
        grade.setAthletic(sc.nextInt());
    }

    @Override
    public int total() {
        return grade.getArt() + grade.getMusic() + grade.getAthletic();
    }

    @Override
    public float avg() {
        return total() / 3.0F;
    }

}
