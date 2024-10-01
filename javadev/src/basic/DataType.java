package basic;

public class DataType {
	int x = 10 ; // field (클래스 내부에서 접근 가능)
	public static void main(String[] args) {		
		int bookSize = 10; // local variable,자동변수 (메소드 안에 변수는 블록 끝에서 소멸이 됨,메모리 절약을 위해서)
		
		int book_size = 10;
		
		{
			int a = 10 ; // 블록 종료를 만나는 순간 소멸됨.
			
			System.out.println(a); // 에러안남
		}
//		System.out.println(a); // 에러남 // local variable은 블록의 끝을 만나는 순간 소멸된다.
		
		int _a = 10;
		int __a = 10;
//		int _ = 10 ; // 이건 에러임(자바9 부터 지원 안됨)
		System.out.println(__a);
		// 자동 변수 소멸 됨
	}
}
