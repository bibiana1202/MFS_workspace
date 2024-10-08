package oop6;

public class PointTest {
	public static void main(String[] args) {
		Point2D up = new Point3D(); // upcasting, 자동 형변환, 묵시적 형변환
		up.x = 100;
		up.y = 200;
//		up.z = 300;
		
		if( up instanceof Point3D) {
			Point3D dn = (Point3D)up; // downcasting, 강제 형변환, 명시적 형변환
			dn.x = 110;
			dn.y = 220;
			dn.z = 330;			
			System.out.println(dn.x+" "+dn.y+" "+dn.z);
		}
		else {
			System.out.println("다운캐스팅이 불가 합니다.");
		}
		
		
	}
}
