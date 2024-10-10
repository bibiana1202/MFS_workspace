package oop9;

public class BoxedPrimitivesTest {

	public static void main(String[] args) {
		/*
		Integer i1 = 10;	// Auto Boxing
		int i2 = i1;		// Auto unboxing
		*/
		Integer n1 = Integer.valueOf(127);
		Integer n2 = Integer.valueOf(127);
		System.out.println(n1 == n2);
		System.out.println(n1.equals(n2));
		
		Integer n3 = 128;
		Integer n4 = 128;
		System.out.println(n3 == n4);
		System.out.println(n3.equals(n4));
	}
}
