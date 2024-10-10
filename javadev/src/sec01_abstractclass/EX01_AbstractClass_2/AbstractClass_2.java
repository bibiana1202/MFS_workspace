package sec01_abstractclass.EX01_AbstractClass_2;

abstract class A{
	abstract void abc();
}

public class AbstractClass_2 {
	public static void main(String[] args) {
		// 객체 생성
		A a1 = new A() {
			void abc() {
				System.out.println("방법2. 익명 이너 클래스 방법으로 객체 생성");
			}
		};
		A a2 = new A() {
			void abc() {
				System.out.println("방법2. 익명 이너 클래스 방법으로 객체 생성");
			}
		};
		
		//메서드 호출
		a1.abc();
		a2.abc();
	}
}
