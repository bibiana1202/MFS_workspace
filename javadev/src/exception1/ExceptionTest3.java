package exception1;

public class ExceptionTest3 {
	public static void main(String[] args) {
		try(NeMam nemam = new NeMam();) { // try with resources
			System.out.println("try 블럭입니다.");
			if(true) throw new Exception("사용자 정의 예외 발생 !!");
			System.out.println("try 종료.");
		} catch (Exception e) {
			System.out.println("catch 블럭입니다.");
		}
		System.out.println("종료");
	}
}
