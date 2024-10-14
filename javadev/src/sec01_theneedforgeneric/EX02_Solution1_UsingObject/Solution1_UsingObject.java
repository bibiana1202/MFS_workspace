package sec01_theneedforgeneric.EX02_Solution1_UsingObject;

// Apple, Pencil 클래스를 모두 저장하거나 꺼낼수 있는 클래스

class Apple {
	@Override
	public String toString() {
		return "사과입니다";
	}
}
class Pencil {
	@Override
	public String toString() {
		return "펜슬입니다";
	}
	
}
class Goods{
	private Object object;
	public Object getObject() {
		return object;
	}
	public void setObject(Object object) {
		this.object = object;
	}
}
public class Solution1_UsingObject {
	public static void main(String[] args) {
		//Goods를 이용해 Apple 객체를 추가하거나 가져오기
		Goods goods1 = new Goods();
		goods1.setObject(new Apple());
		Apple apple = (Apple)goods1.getObject();
		System.out.println(apple);
		
		//Gods 를 이용해 Pencil 객체를 추가하거나 가져오기
		Goods goods2 = new Goods();
		goods2.setObject(new Pencil());
		Pencil pencil = (Pencil)goods2.getObject();
		System.out.println(pencil);
		
		// 잘못된 캐스팅(약한 타입 체크)
		Goods goods3 = new Goods();
		goods3.setObject(new Apple());
		if(goods3.getObject() instanceof Pencil) {
			Pencil pencil2 = (Pencil)goods3.getObject();
			System.out.println(pencil2);
		}else if(goods3.getObject() instanceof Apple){
			Apple Apple2 = (Apple)goods3.getObject();
			System.out.println(Apple2);			
		}
	}
}
