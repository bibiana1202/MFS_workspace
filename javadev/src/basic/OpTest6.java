package basic;

public class OpTest6 {
	public static void main(String[] args) {
		int a = 10, b = 5;
		a = a ^ b;
		b = b ^ a;
		a = a ^ b;

		String str = """
				a=%d
				b=%d
				""";


		System.out.println(String.format(str, a, b));

	}
}
