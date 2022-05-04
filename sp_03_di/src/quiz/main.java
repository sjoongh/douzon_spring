package quiz;

import java.util.Scanner;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class main {

	public static void main(String[] args) {
		
		ApplicationContext applicationContext = new ClassPathXmlApplicationContext("quiz/playCtx.xml");
        print();
        int result = select();

        switch (result) {
            case 1:
                GradeServiceImp gradeServiceImp = (GradeServiceImp) applicationContext.getBean("gradeServiceImp");
                gradeServiceImp.input();
                gradeServiceImp.print();
                break;
            case 2:
                PersonServiceImp personServiceImp = (PersonServiceImp) applicationContext.getBean("personServiceImp");
                personServiceImp.input();
                personServiceImp.print();
                break;
            case 3:
                PlayerServiceImp playerServiceImp = (PlayerServiceImp) applicationContext.getBean("playerServiceImp");
                //playerServiceImp.input();
                playerServiceImp.print();
                break;
            case 4:
            default:
                System.exit(0);
                break;
        }
    }

    public static int select() {
        Scanner scanner = new Scanner(System.in);
        int n = 0;
        try {
            do {
                n = scanner.nextInt();
            } while (n > 4 || n < 1);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;
    }

    public static void print() {
        System.out.println("문제를 골라주세요.");
        System.out.println("1.Grade 2.Person 3.Player 4.종료");
    }

}
