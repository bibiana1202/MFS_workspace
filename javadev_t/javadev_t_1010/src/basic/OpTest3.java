package basic;

public class OpTest3 {
	public static void main(String[] args) {
		System.out.println( true && true );
		System.out.println( true && false );
		System.out.println( false && false );
		
		System.out.println( true || true );
		System.out.println( true || false );
		System.out.println( false || false );
		
		System.out.println(!true);
		System.out.println(!false);
		
		boolean t1 = true;
		System.out.println(!t1);
		
	}
}
