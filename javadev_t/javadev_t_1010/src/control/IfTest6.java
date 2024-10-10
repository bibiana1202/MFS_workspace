package control;

import java.util.Scanner;

public class IfTest6 {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		while (true) {
			System.out.print("Enter your score: ");
			int you = sc.nextInt();
			int com = (int) (Math.random() * 3) + 1;
			System.out.println("You : " + you);
			System.out.println("Com : " + com);
			int result = (you - com + 3) % 3;
			if (result == 0) {
				System.out.println("Tie");
			} else if (result == 1) {
				System.out.println("You win");
			} else {
				System.out.println("Computer wins");
			}
			System.out.println("end");
		}

	}

}
