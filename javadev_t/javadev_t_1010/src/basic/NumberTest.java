package basic;

import java.math.BigDecimal;

public class NumberTest {
	public static void main(String[] args) {
		double d1 = 2;
		double d2 = 1.1;
		
		System.out.println(d1 - d2);
		
		BigDecimal bd1 = new BigDecimal("2");
		BigDecimal bd2 = new BigDecimal("1.1");
		System.out.println(bd1.subtract(bd2));
		
	}
}
