package sec03_threadproperties.EX02_ThreadProperties_2;


// 우선순위
class MyThread extends Thread{
	@Override
	public void run() {
		for (int i = 0; i < 1000000000; i++) {
			System.out.println(getName()+" 우선순위 : "+getPriority());
		}
	
	}
}

public class ThreadProperties_2 {
	public static void main(String[] args) {
		
		// CPU 코어 수
		System.out.println("코어 수 : "+ Runtime.getRuntime().availableProcessors());
		
		// 우선순위 자동 지정
		for (int i = 0; i < 3; i++) {
			Thread thread = new MyThread();
			thread.start();
		}
		
		try {Thread.sleep(100000000000000000l);} catch(InterruptedException e) {}
		
		// 우선 순위 직접 지정
		for (int i = 0; i < 5; i++) {
			Thread thread = new MyThread();
			thread.setName(i+"번째 쓰레드");
			if(i==4) thread.setPriority(10);
			thread.start();
			
		}
	}
}
