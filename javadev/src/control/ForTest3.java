package control;

public class ForTest3 {
	public static void main(String[] args) {

		int sum = 0;
		for(int i =1 ; i <=1000 ; i++) {
			if(i%3==0) sum += i ;
		}
		System.out.println(sum);
		System.out.println("종료");
	}
}
