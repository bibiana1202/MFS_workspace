package control;

import java.util.Scanner;

public class SwitchTest4 {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in);

		System.out.print("0~100 사이의 값을 입력하시오 : ");
		int score = sc.nextInt();

		switch (score / 10) {
		case 9, 10:
			System.out.println("A");
			break;
		case 8:
			System.out.println("B");
			break;
		case 7:
			System.out.println("C");
			break;
		case 6:
			System.out.println("D");
			break;
		case 5, 4, 3, 2, 1, 0:
			System.out.println("F");
			break;
		default:
			System.out.println("에러");
			break;
		}
		
		switch (score / 10) {
			case 9, 10 -> System.out.println("A");
			case 8 -> System.out.println("B");
			case 7 -> System.out.println("C");
			case 6 -> System.out.println("D");
			default -> System.out.println("F");
		}

		
	}
}
