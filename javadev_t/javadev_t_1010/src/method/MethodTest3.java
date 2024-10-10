package method;

import java.util.Scanner;

public class MethodTest3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("가위는 1, 바위는 2, 보는 3 입력 > ");
		int you = sc.nextInt();
		int com = (int) (Math.random() * 3) + 1;

		System.out.println("You : "+rspCaption(you));
		System.out.println("Com : "+rspCaption(com));
		
		int result = (you - com + 3) % 3;
		if (result == 0) {
			System.out.println("Tie");
		} else if (result == 1) {
			System.out.println("You win");
		} else {
			System.out.println("Computer wins");
		}
		System.out.println("end");

		sc.close();
	}

	private static String rspCaption(int val) {
		switch (val) {
		case 1: return "가위";
		case 2: return "바위";
		case 3: return "보";
		default:return "에러";
		}
	}
}
