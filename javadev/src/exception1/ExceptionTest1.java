package exception1;

public class ExceptionTest1 {
	public static void main(String[] args) {
		
		// InterruptedException
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace(); // 에러 지점 역순으로 출력
		}
		
		// ClassNotFoundException
		try {
			Class.forName("java.lang.Object"); // throw new ClassCastException();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

//		System.out.println(3/0); // unchecked exception
		try {
			System.out.println(3/0);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
		System.out.println("종료");
	}
}
