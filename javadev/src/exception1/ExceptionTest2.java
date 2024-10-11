package exception1;

public class ExceptionTest2 {
	public static void main(String[] args) {
		String str = null; //"Hello";

		try {
			System.out.println(str.toString());
			System.out.println("try end. 예외 발생하지 않음.");
		}
		catch(NullPointerException e) // sub 클래스가 위에 있어야 함
		{
			System.out.println("null예외처리");
			e.printStackTrace();
		}
		catch (Exception e) // super 클래스가 아래쪽에 있어야 함 
		{
			e.printStackTrace();
		} finally {
			System.out.println("finally 블록");
		} 

		System.out.println("end");
	}
}
