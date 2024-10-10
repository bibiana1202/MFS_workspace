package basic;

public class OpTest16 {
	public static void main(String[] args) {
		double d = 10;	// 자동 형변환, 묵시적 형변환
		System.out.println(d);
		
		int i = (int) 3.74; // 강제 형변환, 명시적 형변환
		System.out.println(i);
		System.out.println("종료");
	}
}
