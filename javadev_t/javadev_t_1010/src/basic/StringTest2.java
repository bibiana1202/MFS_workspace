package basic;

public class StringTest2 {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer();
		printStr(sb);
		sb.append("실수란 ");printStr(sb);
		sb.append("신을 용서하는 ");printStr(sb);
		sb.append("인간의 ");printStr(sb);
		sb.append("행위이다. ");printStr(sb);
		System.out.println("end");
	}

	private static void printStr(StringBuffer sb) {
		System.out.println(sb.capacity() + ":" + sb.length() + ":" + sb);
	}
}
