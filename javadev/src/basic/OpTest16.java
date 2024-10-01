package basic;

public class OpTest16 {
	public static void main(String[] args) {
		double d = 10; // 정수 -> 실수  (자동 형변환 , 묵시적 형변환)
		System.out.println(d);
		
//		int i = 3.14 ; // 에러 
		// 실수 -> 정수 , 필드 폭이 좁아지거나 : 강제 형변환을 해야함
		int i = (int)3.4 ;  // 소수점 이하 값 버짐 (강제 형변환, 명시적 형변환)
		System.out.println(i);
		
		System.out.println("종료");
	}
}
