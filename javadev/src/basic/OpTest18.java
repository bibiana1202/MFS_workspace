package basic;

public class OpTest18 {
	public static void main(String[] args) {
//		System.out.println(Math.random()); // 0 보다 크거나 같고 1보다 작은 실수값
		
//		double x = Math.random(); // 0.0 <= x < 1
		

		int diceNumber;
		for (int i = 0 ; i < 20 ; i ++)
		{
			diceNumber =  (int)( Math.random() * 12 ) + 4 ; 
			System.out.println(diceNumber);			
		}
		
	}
}
