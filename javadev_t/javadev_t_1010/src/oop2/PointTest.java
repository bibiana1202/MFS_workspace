package oop2;

class Point2D {
	int x;
	int y;
	
	public Point2D() {
		this(10, 20);
		System.out.println("Point2D() 실행");
	}

	public Point2D(int x, int y) {
		this.x = x;
		this.y = y;
		System.out.println("Point2D(x,y) 실행");
	}
}

class Point3D extends Point2D {
	int z;
	
	public Point3D(int x, int y, int z) {
		super(x, y);
		this.z = z;
		System.out.println("Point3D(x,y,z) 실행");
	}
	
	public Point3D() {
		this(1, 2, 3);
		System.out.println("Point3D() 실행");
	}
}

public class PointTest {
	public static void main(String[] args) {
//		Point2D pt1 = new Point2D();
//		System.out.println("x = " + pt1.x);
//		System.out.println("y = " + pt1.y);

//		Point2D pt2 = new Point2D(500, 700);
//		System.out.println("x = " + pt2.x);
//		System.out.println("y = " + pt2.y);
		
//		Point3D pt3 = new Point3D(10, 20, 30);
//		System.out.println("x = " + pt3.x);
//		System.out.println("y = " + pt3.y);
//		System.out.println("z = " + pt3.z);
		
		Point3D pt4 = new Point3D();
		System.out.println("x = " + pt4.x);
		System.out.println("y = " + pt4.y);
		System.out.println("z = " + pt4.z);
		
	}
}
