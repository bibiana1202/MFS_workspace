package control;

public class SwitchTest1 {
	public static void main(String[] args) {
		int n = 1;
		
		switch(n) {
		case 1:
			System.out.println("남자");
			break;
		case 2:
			System.out.println("여자");
			break;
		default:
			System.out.println("에러");
			break;
		}
		System.out.println("종료");
	}
}
