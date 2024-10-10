package control.loop;

public class 이재혁 {
	public static void main(String[] args) {
		for (int k=0; k<2; k++) {
			for (int j = 1; j <= 9; j++) {
				for (int i = 2; i <= 5; i++) {
					System.out.printf("%d * %d = %2d\t", i+(k*4), j, (i+(k*4)) * j);
				}
				System.out.println();
			}
			System.out.println();
		}
	}
}
