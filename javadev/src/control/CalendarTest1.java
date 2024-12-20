package control;

import java.util.Calendar;

public class CalendarTest1 {
	public static void main(String[] args) {
		
		Calendar c = Calendar.getInstance(); // new 가 감춰져 있는것, 내부에서 시스템에 맞는 인스턴스를 생성
		c.set(2024, 10-1 ,1);
		
		
		
		int year = c.get(Calendar.YEAR);
		System.out.println(year);
		int month = c.get(Calendar.MONTH) + 1; // 0번부터 시작!!!!
		System.out.println(month); 
		int day = c.get(Calendar.DATE);
		System.out.println(day);
		int hour = c.get(Calendar.HOUR_OF_DAY);
		System.out.println(hour);
		int minutes = c.get(Calendar.MINUTE);
		System.out.println(minutes);
		int second = c.get(Calendar.SECOND);
		System.out.println(second);
		
		// 요일
		int dayOfWeek = c.get(Calendar.DAY_OF_WEEK);
		System.out.println(dayOfWeek);
		
		// 마지막날
		int endDay = c.getActualMaximum(Calendar.DATE);
		System.out.println(endDay);

	}
}
