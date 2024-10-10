package arrays;

import java.util.Arrays;
import java.util.Scanner;

public class TypingGame이혜진 {
	public static void main(String[] args) {

		// 타이핑 게임
		Scanner sc = new Scanner(System.in);
		
		String[] keywords = {
				"oop", "primitive type", "java", "james gosling", 
				"for", "while", "do while", "continue",
				"break", "Scanner" };

		int[] item = new int[3];

		// 랜덤으로 나온 수 체크하는 handle 배열
		boolean[] check = new boolean[keywords.length];

		// 0번째에다가 미리 랜덤값 할당 후 해당 랜덤값과 동일한 check 배열 인덱스에 true 표시
		item[0] = (int) (Math.random() * keywords.length);
		check[item[0]] = true;

		for (int i = 1; i < item.length; i++) { // item 배열 인덱스 1번부터 값 할당해주기

			int temp;

			do {
				temp = (int) (Math.random() * keywords.length); // 랜덤값을 지정 후 check 배열로 통해 값이 있는지 없는지 확인한 후 동일한 값이 있으면 다시
																// 랜덤값 지정
			} while (check[temp]);

			item[i] = temp; // 동일한 값이 없는 temp 값을 item 배열에다 할당
			check[temp] = true; // 그 temp 값과 동일한 check 배열 인덱스에 true로 꼭 표시
		}

		System.out.println(Arrays.toString(item));

		int miss_count = 0;
		System.out.println("Game Start~!!!");
		long startTime = System.currentTimeMillis(); // 시간 측정 시작( System.currentTimeMillis() : 현재 시간 )
		for (int i = 0; i < item.length; i++) {
			System.out.print(keywords[item[i]] + " ▶️ ");
			String input = sc.nextLine(); // 한 줄로 받을 수 있음
			if (!input.equals(keywords[item[i]])) {
				miss_count++;
				System.out.println("typing miss");
				i--;
			}
		}

		long endTime = System.currentTimeMillis(); // 종료 시간
		System.out.println("총 소요시간 : " + ((endTime - startTime) / 1000) + "초");
		System.out.println("오타 횟수 : " + miss_count);
		System.out.println("end");

		sc.close();
	}

}
