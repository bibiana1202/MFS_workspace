package basic;

public class StringTest1 {
	public static void main(String[] args) {
		String str1 = "Hello Java!";
		
		System.out.println(str1.indexOf('a'));
		System.out.println(str1.indexOf('a',8));
		
		String str2 = "Java_Study";
		System.out.println(str2);
		System.out.println(str2.replace("Study","공부"));
		System.out.println(str2);
		System.out.println(str2 = str2.replace("Study","공부"));
		System.out.println(str2);
	}
}
