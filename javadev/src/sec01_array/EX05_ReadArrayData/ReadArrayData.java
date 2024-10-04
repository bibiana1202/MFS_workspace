package sec01_array.EX05_ReadArrayData;

import java.util.Arrays;

public class ReadArrayData {
	public static void main(String[] args) {
		int[] array = new int[] {3,4,5,6,7};
		
		// 배열의 길이 구하기
		System.out.println(array.length);
		
		// 출력하기 1
		// 배열의 인덱스 번호를 사용해 배열의 모든 우너소 값을 1개씩 추력
		System.out.print(array[0] + " ");
		System.out.print(array[1] + " ");
		System.out.print(array[2] + " ");
		System.out.print(array[3] + " ");
		System.out.print(array[4] + " ");
		System.out.println();
		
		// 출력하기 2
		// for 문 사용
		for(int i = 0 ; i< array.length; i++) {
			System.out.print(array[i]+" ");
		}
		System.out.println();
		
		// 출력하기 3
		// for-each 문 사용
		for(int k : array) {
			System.out.print(k+ " ");
		}
		System.out.println();
		
		// 출력하기 4
		// Arrays 클래스의 toString 메서드 사용
		System.out.println(Arrays.toString(array));
	}
}
