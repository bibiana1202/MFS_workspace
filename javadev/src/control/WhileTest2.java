package control;

public class WhileTest2 {
	public static void main(String[] args) {
		// 1부터 1000 까지 3의 배수의 합계
		
		int sum = 0 ;
		int i = 1;
		while(i<=1000) {
			if(i%3==0) sum += i ;
			i++;
		}
		System.out.println(sum);
	}
}
