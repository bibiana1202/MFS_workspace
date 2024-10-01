package basic;

public class PrimitiveTypeTest {
	public static void main(String[] args) {
		boolean b = true; // 1 byte 할당, 1 bit 사용
		
		byte b2 = 127; // 128 부터는 에러
		System.out.println(b2);

//	char c = "가"; // 문자열 사용시 에러남 -> "" 는 인스턴스를 만들어 줘서.... 기본 자료형은 안됨
		char c = '그' ; // 기본 자료형은 ''
		System.out.println(c);
		// 아스키코드 ASCII 
		char c2 = 65;
		System.out.println(c2); // A 가 출력됨
	
//		int i = 2147483648; // 에러
		int i = 2147483647 ;
		System.out.println(i);
		int i2 = 2147483647 + 1 ; 
		System.out.println(i2); // 최소값으로 돌아옴
		
		short sh  = 32767 ;
//		short sh1  = 32768 ; // 에러
		System.out.println(sh);
		
		long l1 = 2147483648L ; // 정수 타입 숫자 기본이 int 값이여서 L 을 붙여야 long 타입이라고 알려줌 
		System.out.println(l1);
		double d1 = 3.1415926535;
		System.out.println(d1);
		float f1 = 3.1415926535F;  // 소수점 타입 숫자 기본이 doulbe 값이여서 F 을 붙여야 long 타입이라고 알려줌
		System.out.println(f1); // 정밀도가 조금 떨어짐
	
	
		String str = "가나다";
		System.out.println(str);
	
	}
	
}
