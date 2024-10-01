package basic;

import java.math.BigDecimal;
public class NumberTest {
	public static void main(String[] args) {
		double d1 = 2 ;
		double d2 = 1.1;
		
		System.out.println(d1- d2); // 완벽한 숫자 표현이 어려울 때가 있음
		// 정밀한 값을 사용할땐 double 타입을 사용하면 안됨.
		
		// 크고 정밀한 값 사용시 사용하는 클래스
		BigDecimal bd1 = new BigDecimal("2"); // 큰따옴표 생략 하면 안됨...... 문자열로 넣어줘야함!
		BigDecimal bd2 = new BigDecimal("1.1");
		System.out.println(bd1.subtract(bd2));
	}
}
