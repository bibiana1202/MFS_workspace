package basic;

public class OpTest6 {
	public static void main(String[] args) {
		int a = 10, b =5;
		a = a^b;
		b =b^a;
		a =a^b;
		
//		System.out.println("""
//				a=${a}
//				b=${b}
//				""");
		
		

		System.out.println(a);
		System.out.println(b);
	}
}
