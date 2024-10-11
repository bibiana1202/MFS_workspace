package exception1;

import java.io.IOException;

public class ExceptionTest4 {
	public static void main(String[] args) {
		try {
			runMethod();
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println("main end");
	}

	private static void runMethod() throws IOException{
		// 라이브러리를 만들때 throws 를 쓰는것이 좋다.
		// 리소스를 다루는곳에 로직이 담겨있으면 throws 로 미루는 것이 좋다.
		// throws : 예외처리 미루기 나를 호출한 쪽으로 미루기~
		if(true) throw new IOException("파일 처리 예외 상황 발생!!!");
		System.out.println("runMethod end");
	}
}
