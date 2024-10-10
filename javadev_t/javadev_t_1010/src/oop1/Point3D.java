package oop1;

public class Point3D extends Point2D {
	private int z;

	public int getZ() {
		return z;
	}
	public void setZ(int z) {
		this.z = z;
	}

	public void print() { // method override (메소드 재정의)
		super.print();
		System.out.println("z = " + getZ());
	}
}
