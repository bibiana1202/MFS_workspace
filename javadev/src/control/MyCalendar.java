package control;

import java.util.Calendar;
import java.util.Scanner;

public class MyCalendar {
	public static void main(String[] args) {

		Scanner sc= new Scanner(System.in);
		System.out.print("년도 입력을 받습니다:"); int year = sc.nextInt();
		System.out.print("월도 입력을 받습니다:"); int month = sc.nextInt();
//				
		
		Calendar c = Calendar.getInstance(); // new 가 감춰져 있는것, 내부에서 시스템에 맞는 인스턴스를 생성
		
		c.set(year, month-1 ,1);
		System.out.println(c.getTime());

		// 요일
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
//		System.out.println(dayOfWeek);
		
		// 마지막날
		int endDay = c.getActualMaximum(Calendar.DATE);
//		System.out.println(endDay);

		// 방법 1.
		System.out.println(year+"년 "+month+"월");
		System.out.println("일 월 화 수 목 금 토");		
		
		int daycount = 1;
		for(int i= 0; daycount<=endDay ;i++) {
			for(int dw = 1 ; dw <=7  ; dw++) {
				if(daycount>endDay) 
					break;
				
				if(i==0) 
				{
					if(dw<dayOfWeek) {
						System.out.print("   ");
					}
					else {
						System.out.print(daycount < 10 ? " " + daycount+ " ": daycount+ " ");
						daycount++;
					}
				}
				else
				{
					System.out.print(daycount < 10 ? " " + daycount+ " ": daycount+ " ");
					daycount++;
				}
			}
			System.out.println();
		}
		
		
		// 방법2.
		System.out.println(year+"년 "+month+"월");
		System.out.println("일 월 화 수 목 금 토");
		for(int d = 1 ; d < dayOfWeek;d++) {
			System.out.print("   ");
		}
		for(int date = 1 , d= dayOfWeek ; date <= endDay ;date++,d++) {
			System.out.print(date<10 ?" " + date +" " : date+ " ");
			if(d%7 ==0) System.out.println();
		}
		
	}
}
