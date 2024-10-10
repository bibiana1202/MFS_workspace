package control;

public class SwitchTest3 {
	public static void main(String[] args) {
		int n = 77;
		
		String gubun = switch(n) {
			case 1,3->"남자";
			case 2,4->"여자";
			default ->"에러";
		};
		System.out.println("주민번호7번째 숫자가 " + n + "은 " + gubun + "입니다.");
		System.out.println("종료");
	}
}
