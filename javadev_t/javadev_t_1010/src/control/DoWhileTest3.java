package control;

public class DoWhileTest3 {
	public static void main(String[] args) {
	
		// 1부터 1000까지 3의 배수의 합계
		int sum = 0;
		
		int i = 1;
		do {
			if (i%3 == 0) {
				sum += i;
			}
			i++;
		} while(i <= 1000);
		
		System.out.println(sum);
		System.out.println("종료");
	}
}
