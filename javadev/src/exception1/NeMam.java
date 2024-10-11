package exception1;

public class NeMam implements AutoCloseable{
	// AutoCloseable : NeMam 이 사용되면 알아서 try 블록이 빠질때 close 자동 실행
	@Override
	public void close() throws Exception {
		System.out.println("nemam 자원을 해제 합니다.");
	}

}
