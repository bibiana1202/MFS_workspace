package method;

public class MethodTest6 {
	public static void main(String[] args) {
		print(1);
		print(2,3);
		print(4,5,6);
	}

	private static void print(int... i) {
		for(int j = 0 ; j< i.length ; j++) {
			System.out.print(i[j]+"\t");
		}
		System.out.println();
	}


	/*
	private static void print(int i) {
		System.out.println(i);
	}
	
	private static void print(int i, int j) {
		System.out.println(i+"\t"+j);
		
	}

	private static void print(int i, int j, int k) {
		System.out.println(i+"\t"+j+"\t"+k);
		
	}
*/

}