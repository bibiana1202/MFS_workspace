package basic;

import java.util.Scanner;

public class OpTest14 {
	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		System.out.print("짝수 홀수를 판별합니다. 정수 x 입력 > ");
		int x = sc.nextInt();
		System.out.println((x&1) == 0 ? "짝수":"홀수");
		
		System.out.println("종료");		
	}
}
