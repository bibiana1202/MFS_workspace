package basic;

public class StringTest2 {
	public static void main(String[] args) {
		StringBuffer sb = new StringBuffer();
		// 문자열이 계속 수정이 가해져야한다면 StringBuffer를 사용해야함.
		printStr(sb);
		
		sb.append("실수란 ");printStr(sb);
		sb.append("신을 용서하는 ");printStr(sb);
		sb.append("인간의 ");printStr(sb);
		sb.append("행위이다. ");printStr(sb);
		
		
	}

	private static void printStr(StringBuffer sb) {
		System.out.println(sb.capacity()+":"+sb.length()+":"+sb);
	}
}