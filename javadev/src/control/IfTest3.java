package control;

import java.util.Scanner;

public class IfTest3 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("0~100 사이의 값을 입력하시오 : ");
		int score = sc.nextInt();
		
		if (score < 0 || 100 < score ){
			System.out.println("에러");
		}
		else if(90 <= score && score <= 100) {
			System.out.println("A");
		}
		else if(80 <= score && score < 90) {
			System.out.println("B");
		}
		else if(70 <= score && score < 80) {
			System.out.println("C");
		}
		else if(60 <= score && score < 70) {
			System.out.println("D");
		}
		else if(0  <= score && score < 60) {
			System.out.println("F");
		}
		else {
			System.out.println("에러");
		}

		
	}
}