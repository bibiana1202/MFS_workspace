package basic;

public class PrimitiveTypeTest {
	public static void main(String[] args) {
		boolean b = true; // 1 byte할당, 1bit사용
		byte b2 = 127;
		System.out.println(b2);
		
		char c = '가';
		char c2= 65;
		System.out.println(c);
		System.out.println(c2);
		
		int i = 2147483647 + 1;
		System.out.println(i);
		
		short sh = 32767;
		System.out.println(sh);
		
		long l1 = 2147483648L;
		
		double pi = 3.1415926535;
		System.out.println(pi);
		
		float pi2 = 3.1415926535f;
		System.out.println(pi2);
		
		String str = "가나다";
		System.out.println(str);
	}
}
