package control.loop;

public class Gugu {
	public static void main(String[] args) {

		for(int i=2; i<=9; i+=4) {
			for(int j=1; j<=9; j++) {
				for(int k=i; k<=i+3; k++) {
					System.out.printf("%2d*%2d=%2d   ",k,j,k*j);
				}
				System.out.println();
			}
			System.out.println();
		}
		System.out.println("end");
	}
}
