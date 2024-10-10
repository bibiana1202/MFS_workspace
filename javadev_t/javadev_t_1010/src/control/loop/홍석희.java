package control.loop;

public class 홍석희 {
	public static void main(String[] args) {
		for (int k = 2; k <= 6; k += 4) {
			for (int i = 1; i <= 9; i++) {
				for (int j = k; j <= 9 - (5 - k); j++) {
					System.out.print(j + " X " + i + " = " + i * j + "\t");
				}
				System.out.println();
			}
			System.out.println();
		}
		System.out.println("End");
	}
}

