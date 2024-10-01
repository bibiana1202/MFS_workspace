package basic;

import java.util.Scanner;

public class OpTest1 {
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in); // 키보드 입력
		System.out.print("a : ");
		int a = sc.nextInt();
		System.out.print("b : ");
		int b = sc.nextInt();
		
		System.out.println(a + "+"+b+"="+a+b);
		System.out.println(a + "+"+b+"="+(a+b));
		System.out.println(a + "-"+b+"="+(a-b));
		System.out.println(a + "*"+b+"="+(a*b));
		System.out.println(a + "/"+b+"="+(a/b));
		System.out.println(a + "/"+b+"="+((double)a/b)); // 형변환
		System.out.println(a + "%"+b+"="+(a%b));
		System.out.println("종료");
	}
}
