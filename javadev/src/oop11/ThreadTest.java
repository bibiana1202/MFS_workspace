package oop11;

class MyClass {
	
}

public class ThreadTest extends MyClass implements Runnable {
	public void run() {
		for(int i=1; i<=5; i++) {
			System.out.println("run : " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("run 종료");
	}
	public static void main(String[] args) {
		Runnable r = new ThreadTest();
		Thread t = new Thread(r);
		t.start();
		
		for(int i=1; i<=5; i++) {
			System.out.println("main : " + i);
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}
		System.out.println("main 종료");
	}
}
