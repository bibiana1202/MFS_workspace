package oop5;

public class AnimalTest {
	public static void main(String[] args) {
//		Animal a1  = new Animal();
//		System.out.println(a1);
//		
//		
//		if(a1 instanceof Bird) {
//			Bird b1 = (Bird) a1;
//			System.out.println(b1);			
//		}
//		else {
//			System.out.println("다운 캐스팅이 되지 않는다.");
//		}
//		

		
		
//		Bird b2 = new Bird();
//		System.out.println(b2);
//		
//		Animal a2 = b2 ; // upcasting 자동 형변환
//		System.out.println(a2);
//		
//		if(a2 instanceof Bird) {
//			Bird b3 = (Bird) a2;
//			System.out.println(b3);			
//		}
//		else{
//			System.out.println("다운 캐스팅이 되지 않는다.");
//		}
//		
		
		
		
//		Condor c1 = new Condor();
//		System.out.println(c1);
//
//		if(c1 instanceof Bird) {
//			Bird b4 = c1;			
//			System.out.println(b4);
//		}
//		else{
//			System.out.println("업 캐스팅이 되지 않는다.");
//		}
//
		
		
//		Condor c1 = new Condor();
//		System.out.println(c1);
//		Animal a3 = c1;
//		System.out.println(a3);
//		
//		if(a3 instanceof Bird) {
//			Bird b5= (Bird) a3;
//			System.out.println(b5);			
//		}
//		else {
//			System.out.println("다운 캐스팅이 되지 않는다.");
//		}
		
		
//		Bird b6 = new Bird();
//		System.out.println(b6);
//		Animal a4 = b6;
//		System.out.println(a4);
//		if(a4 instanceof Condor) {
//			Condor c2 = (Condor) a4;
//			System.out.println(c2);			
//		}
//		else {
//			System.out.println("다운 캐스팅이 되지 않는다.");
//		}
//		
		
		Condor c3 = new Condor();
		Bird b7 = c3;
		System.out.println(b7);
		
		if(b7 instanceof Duck) {
			Duck d = (Duck)b7;
			System.out.println(d);			
		}
		else {
			System.out.println("다운 캐스팅이 되지 않는다.");			
		}
		
		
		
		
		
		System.out.println("종료");
	}
}
