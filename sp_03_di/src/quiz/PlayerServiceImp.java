package quiz;

import java.util.Scanner;

public class PlayerServiceImp implements IOService {

	private Player player;

    public void setPlayer(Player player) {
        this.player = player;
    }

    @Override
    public void print() {
        System.out.println("\n");
        System.out.println("이름 : " + player.getName());
        System.out.println("포지션 : " + player.getPosition());
        System.out.println("종목 : " + player.getSports());

    }

    @Override
    public void input() {
        Scanner scanner = new Scanner(System.in);
        System.out.print("이름 : ");
        player.setName(scanner.nextLine());
        System.out.print("포지션 : ");
        player.setPosition(scanner.nextLine());
        System.out.print("종목 : ");
        player.setSports(scanner.nextLine());
    }
}
