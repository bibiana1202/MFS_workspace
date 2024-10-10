package basic;



public class OpTest1 {
	public static void main(String[] args) {
		java.util.Scanner sc = new java.util.Scanner(System.in);
		System.out.print("a : "); 
		int a = sc.nextInt();
		System.out.print("b : ");
		int b = sc.nextInt();
		
		Integer i = 10;
		
		System.out.println(a + "+" + b + "=" + (a + b));
		System.out.println(a + "-" + b + "=" + (a - b));
		System.out.println(a + "*" + b + "=" + (a * b));
		System.out.println(a + "/" + b + "=" + ((double)a / b));
		System.out.println(a + "%" + b + "=" + (a % b));
		System.out.println("종료");
	}
}
