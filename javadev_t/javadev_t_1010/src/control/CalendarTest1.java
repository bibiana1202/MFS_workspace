package control;

import java.util.Calendar;

public class CalendarTest1 {
	public static void main(String[] args) {
		
		Calendar c = Calendar.getInstance();
		c.set(2024, 10-1, 1);
		
		int year = c.get(Calendar.YEAR);		// 년도
		System.out.println(year);
		int month = c.get(Calendar.MONTH) + 1;	// 월(1월이 0으로 저장)
		System.out.println(month);
		
		int hour = c.get(Calendar.HOUR_OF_DAY); // 시
		System.out.println(hour);
		int minute = c.get(Calendar.MINUTE);	// 분
		System.out.println(minute);
		int second = c.get(Calendar.SECOND);	// 초
		System.out.println(second);
		
		int day = c.get(Calendar.DAY_OF_WEEK);	// 요일(일요일:1, 토요일:7)
		System.out.println(day);
		int endday = c.getActualMaximum(Calendar.DATE);	// 그 달의 마지막 날짜
		System.out.println(endday);
	}
}
