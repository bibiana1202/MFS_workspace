package basic;


/*  켈리 방정식 테스트
  박혜정	2024-09-30	......
*/ 
public class Hello {
	public static void main(String[] args) {
		double money = 1_000_000;
		
		for (int i =0 ; i <50 ; i ++) {
			money = money + (money/2 * 0.4) ;
			money = money - (money/2 * 0.3) ;
		}
		
		System.out.println("결과\t"+money);
		System.out.println("결과\\t"+money);
	}
}
