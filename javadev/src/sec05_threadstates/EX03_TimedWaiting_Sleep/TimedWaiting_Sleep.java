package sec05_threadstates.EX03_TimedWaiting_Sleep;

class MyThread extends Thread{
	@Override
	public void run() {
		try {
			Thread.sleep(3000);
		}catch(InterruptedException e) {
			System.out.println("-- sleep() 진행중 interrupt() 발생");
			for(long i = 0 ; i < 100000000l ; i++) {} // 시간 지연
			
		}
	}
}

public class TimedWaiting_Sleep {
	public static void main(String[] args) {
		MyThread myThread = new MyThread();
		myThread.start();
		
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State ="+ myThread.getState());
		// TIME_WAITING
		myThread.interrupt();
		try {Thread.sleep(100);} catch(InterruptedException e) {}
		System.out.println("MyThread State ="+ myThread.getState());
	}
}
