package control.loop;

public class 정희준 {
	public static void main(String[] args) {
		for(int k = 1; k<=5; k+=4) {
			for(int i =1; i<=9; i++) {
				for (int j =k+1; j<=k+4; j++) {
					System.out.print(j + "*" + i +"=" + i*j + "\t");
				}
				System.out.println();
			}
			System.out.println();
		}
		System.out.println("end");
	}
}
