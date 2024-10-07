package basic;

public class StringTest3 {
	public static void main(String[] args) {
		StringBuilder sb = new StringBuilder();
		
		printStr(sb);
		
		sb.append("실수란 ");printStr(sb);
		sb.append("신을 용서하는 ");printStr(sb);
		sb.append("인간의 ");printStr(sb);
		sb.append("행위이다. ");printStr(sb);
		
		
	}

	private static void printStr(StringBuilder sb) {
		System.out.println(sb.capacity()+":"+sb.length()+":"+sb);
	}
}
