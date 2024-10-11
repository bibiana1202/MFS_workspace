package oop4.singleton;
/*
 * 1) 생성자를 private으로 설정, 객체는 단한번만 생성(외부에서 생성x)
 * 2) 자기자신의 객체를 참조 할 수 있
 */
class Single{
	// 2. 공유 변수 나자신
	private static Single single = new Single();

	// 1. 내부 메소드를 통해서 인스턴스 생성할수 있게
	private Single() {
		
	}
	
	// 3. 겟터
	public static Single getInstance() {
//		if(single == null) { // 4. 처음 한번 실행했을때만 실행
//			single = new Single();
//		}
		return single; // 만들어놓은 인스턴스만 리턴
	}
}

public class SingletonTest { // Singleton
	public static void main(String[] args) {
		
		Single s1 = Single.getInstance();
		Single s2 = Single.getInstance();
		
		// 해시코드가 같다고 해서 같은 인스턴스 아닐수도 있음. 분포가 잘못되면 해시코드가 4바이트여서 ...
		// 해시코드가 다르면 다른 인스턴스라고 확신 할수 있다.
		System.out.println(s1.hashCode());
		System.out.println(s2.hashCode());
		
		// 하나의 인스턴스 공유하기 때문에 해시코드가 같음
		// 싱글톤 패턴
	}
}
