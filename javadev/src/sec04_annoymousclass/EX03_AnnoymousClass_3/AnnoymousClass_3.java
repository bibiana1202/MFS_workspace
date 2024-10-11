package sec04_annoymousclass.EX03_AnnoymousClass_3;


interface A{
	public abstract void abc();
}

class B implements A{
	public void abc() {
		System.out.println("입력 매개변수 전달");
	}
}

class C{
	void cde(A a) {
		a.abc();
	}
}

public class AnnoymousClass_3 {
	public static void main(String[] args) {
		C c = new C();
		// 방법 1 . 클래스명 O + 참조 변수명 o
		A a = new B();
		c.cde(a);
		// 방법 2 . 클래스명 o + 참조 변수명 x
		c.cde(new B());
	}
}
