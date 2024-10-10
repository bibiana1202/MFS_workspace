package oop7;

import org.junit.Test;

public class Circle extends Shape {
	int r = 10;
	void size() {
		res = r*r*3.14;
	}
	@Test
	public void testSize() {
		Circle c = new Circle();
		c.size();
		System.out.println(c.res);
	}
	@Override
	void area() {
		size();
	}
}
