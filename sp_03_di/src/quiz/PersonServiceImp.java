package quiz;

import java.util.Scanner;

public class PersonServiceImp implements IOService {

	private Person person;

    public void setPerson(Person person) {
        this.person = person;
    }

    @Override
    public void print() {
        System.out.println("\n");
        System.out.println("이름 : " + person.getName());
        System.out.println("나이 : " + person.getAge());
        String gender = person.isGender() ? "남" : "여";
        System.out.println("성별 : " + gender);
        String isStudent = person.isStudent() ? "학생" : "회사원";
        System.out.println("직업 : " + isStudent);

    }

    @Override
    public void input() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("이름?: ");
        person.setName(scanner.nextLine());
        System.out.print("나이? : ");
        person.setAge(Integer.parseInt(scanner.nextLine()));
        System.out.print("성별?(남, 여) : ");
        String str = "";
        do {
            str = scanner.nextLine();
        } while (!(str.equals("남") || str.equals("여")));
        if (str.equals("남")) {
            person.setGender(true);
        } else if(str.equals("여")){
            person.setGender(false);
        }

        System.out.print("당신은 학생 or 회사원입니까? : ");
        String answer = "";
        answer = scanner.nextLine();
        if (answer.equals("학생")) {
            person.setStudent(true);
        } else if (answer.equals("회사원")) {
            person.setStudent(false);
        } else {
            System.out.println("당신은 학생이나 회사원이 아닙니다.");
        }
    }

}
