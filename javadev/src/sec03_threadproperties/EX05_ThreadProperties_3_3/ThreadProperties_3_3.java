package sec03_threadproperties.EX05_ThreadProperties_3_3;

class MyThread extends Thread{
	@Override
	public void run() {
		System.out.println(getName()+": "+(isDaemon()?"데몬쓰레드":"일반쓰레드"));
		for (int i = 0; i < 6; i++) {
			System.out.println(getName()+":"+i+"초");
			try {Thread.sleep(1000);} catch (InterruptedException e) {}
		}
	}
}


public class ThreadProperties_3_3 {
	public static void main(String[] args) {
		// 일반 쓰레드
		Thread thread1 = new MyThread();
		thread1.setDaemon(false);
		thread1.setName("thread1");
		thread1.start();
		
		// 데몬 쓰레드
		Thread thread2 = new MyThread();
		thread2.setDaemon(true);
		thread2.setName("thread2");
		thread2.start();
		
		// 3.5 초후 main 쓰레드 종료
		try {Thread.sleep(3500);} catch(InterruptedException e) {}
		System.out.println("main Thread 종료");
		
	}
}
