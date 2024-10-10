package method;

public class MethodTest5 {
	public static void main(String[] args) {
		int a = 10;
		
		int b = square(a);
		System.out.println(a);
		System.out.println(b);
	}

	private static int square(int a) {	// call by value
		a = a * a;
		return a;
	}
}
