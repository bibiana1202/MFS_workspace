package exception1;

public class ExceptionTest1 {
	public static void main(String[] args) {
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		try {
			Class.forName("java.lang.Object1"); // throw new ClassCastException();
		} catch (Exception e) {
			System.out.println("잘못된 클래스입니다...");
		}
		
		try {
			System.out.println(3/0);
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("종료");
	}
}
