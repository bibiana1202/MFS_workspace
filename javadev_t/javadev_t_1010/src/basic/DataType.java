package basic;

public class DataType {
	int x = 10; // field
	public static void main(String[] args) {
		int bookSize = 10; // local variable
		{
			int a = 10;
			System.out.println(a);
		}
		//System.out.println(a); //local variable은 블럭의 종료를 만나는 순간 소멸

		int book_size = 10;
		int _a = 10;
		int __a = 10;
		// int _ = 100;
		System.out.println(__a);
	}
}
