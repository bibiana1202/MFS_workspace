package basic;

public class OpTest1b {
	public static void main(String[] args) {
		int a = 10;
		int t = 5 ;
		t += a + 3 ; // t = t + a + 3
		t += ++a + 3 ; // t = t +( (a = a + 1) + 3 )
		System.out.println(t);
	}
}


