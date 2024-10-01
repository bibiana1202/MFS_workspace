package basic;

import java.util.Scanner;

public class OpTest14 {
	public static void main(String[] args) {

		Scanner sc = new Scanner(System.in); // 키보드 입력
		System.out.print("x : ");
		int x = sc.nextInt();

		System.out.println(x % 2 == 0 ? "찍수" : "홀수");

	}
}
