package method;

public class MethodTest1 {
	public static void main(String[] args) {
		print();
		print("JAVA");
		print("Hello");
		
		
		int i = 10, j= 5;
		System.out.println(i + "+" + j + "=" + add(i,j));
		System.out.println(i + "-" + j + "=" + subs(i,j));
		System.out.println(i + "*" + j + "=" + mul(i,j));
		System.out.println(i + "/" + j + "=" + div(i,j)+"..."+mod(i,j));
		System.out.println("주사위 숫자는 "+dice());
		System.out.println("end");
		
		
		
	}
	
	

	private static int dice() {
		
		return (int)(Math.random()*6)+1;
	}



	private static int mod(int i, int j) {
		return i%j;
	}



	private static int div(int i, int j) {
		return i/j;
	}



	private static int mul(int i, int j) {
		return i*j;
	}



	private static int subs(int i, int j) {
		return i-j;
	}



	private static int add(int i, int j) {
		return i+j;
	}



	public static void print() {
		System.out.println("-------------------");
		System.out.println("       SESAC       ");
		System.out.println("-------------------");
		return;
	}
	public static void print(String str) {
		System.out.println("-------------------");
		System.out.println("       "+str+"       ");
		System.out.println("-------------------");
		return;
	}
}
