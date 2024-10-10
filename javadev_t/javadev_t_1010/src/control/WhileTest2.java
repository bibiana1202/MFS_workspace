package control;

public class WhileTest2 {
	public static void main(String[] args) {
		// 1부터 1000까지 3의 배수의 합계
		
		int sum = 0;
		int i=3; 
		while(i<=1000) {
			sum += i;
			i+=3;
		}
		
		
		System.out.println(sum);
		System.out.println("종료");
		
	}
}
