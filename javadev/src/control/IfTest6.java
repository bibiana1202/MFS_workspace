package control;

import java.util.Scanner;

public class IfTest6 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);

		System.out.print("가위는1, 바위는2, 보는3을 입력하세요 : ");
		int you = sc.nextInt();
		String strYou = Integer.toString(you);
		switch(strYou)
		{
			case "1": 
				strYou = "가위"; break;
			case "2": 
				strYou = "바위"; break;
			case "3": 
				strYou = "보"; break;
		
		}
		System.out.println("당신 : "+ strYou);
		
		int com = (int) (Math.random() * 3) + 1; // 0 <= math.random() < 1 => 소수점으로 나옴
		String strCom = Integer.toString(com);
		switch(strCom)
		{
			case "1": 
				strCom = "가위"; break;
			case "2": 
				strCom = "바위"; break;
			case "3": 
				strCom = "보"; break;
		
		}
		System.out.println("컴퓨터 : "+ strCom);
		
		if (you == com) {
			System.out.println("무승부 입니다.");
		} else if (you == 1) {
			if (com == 2) {
				System.out.println("당신의 패배 입니다.");
			} else if (com == 3) {
				System.out.println("당신의 승리 입니다.");
			}
		} else if (you == 2) {
			if (com == 1) {
				System.out.println("당신의 승리 입니다.");
			}  else if (com == 3) {
				System.out.println("당신의 패배 입니다.");
			}
		} else if (you == 3) {
			if (com == 1) {
				System.out.println("당신의 패배 입니다.");
			} else if (com == 2) {
				System.out.println("당신의 승리 입니다.");
			} 
		}

	}
}
