package arrays;

import java.util.Arrays;

public class ArrayTest1 {
	public static void main(String[] args) {

		int[] n = {100, 200, 300};
		
		System.out.println(Arrays.toString(n));
		for (int i = 0; i < n.length; i++) {
			System.out.println(n[i]);
		}
		System.out.println("end");
	}
}
