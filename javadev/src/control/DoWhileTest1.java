package control;

public class DoWhileTest1 {
	public static void main(String[] args) {
		int i = 5;
		do {
			System.out.println(i + ": 안녕하세여");
			i++;
		}while(i<=3);
		// 무조건 한번은 수행됨~!
		System.out.println("종료");
	}
}
