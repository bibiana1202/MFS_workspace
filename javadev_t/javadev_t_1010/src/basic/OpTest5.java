package basic;

public class OpTest5 {
	public static void main(String[] args) {
		int a = 10, b = 5;
		int temp;
		temp = a;
		a = b;
		b = temp;
		
		System.out.println("a = "+ a);
		System.out.println("b = "+ b);
	}
}
