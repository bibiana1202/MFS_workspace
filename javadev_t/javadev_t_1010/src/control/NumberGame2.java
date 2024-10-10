package control;

import java.util.Scanner;

public class NumberGame2 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		int c1, c2, c3;	// 컴퓨터가 생성할 0~9 사이의 중복되지 않은 숫자 3개를 저장할 변수들
		int h1, h2, h3;
		int s= 0, b=0;		// strike, ball
		int count = 0;	// 시도한 횟수
		c1 = (int)(Math.random() * 10);
		do {
			c2 = (int) (Math.random() * 10);
		} while (c2 == c1);
		do {
			c3 = (int) (Math.random() * 10);
		} while (c3 == c1 || c3 == c2);
		for(; s != 3 ; count++) {
			s = b = 0;
			System.out.print("0~9 사이의 중복되지 않은 숫자 3개 입력 ex. 1 2 3 > ");
			h1 = sc.nextInt();
			h2 = sc.nextInt();
			h3 = sc.nextInt();
			if (h1 == c1) s++;
			else if(h1 == c2 || h1 == c3) b++;
			if (h2 == c2) s++;
			else if(h2 == c1 || h2 == c3) b++;
			if (h3 == c3) s++;
			else if(h3 == c1 || h3 == c2) b++;
			System.out.println("[" + s +"S " + b + "B]");
		}
		System.out.println("축하합니다! "+count+"번만에 성공하셨습니다!!");
	}
}
