package sec05_threadstates.EX07_Waiting_WaitNotify_2;


class DataBox{
	boolean isEmpty = true;
	int data;
	synchronized void inputdata(int data) {
		if(!isEmpty) {
			try {wait();}catch(InterruptedException e) {} // WAITING
		}
		this.data= data;
		isEmpty = false;
		System.out.println("입력 데이터: "+data);
		notify();
	}
	synchronized void outputData(int data) {
		if(isEmpty) {
			try {wait();}catch(InterruptedException e) {} // WAITING
		}
		isEmpty = true;
		System.out.println("출력 데이터: "+data);
		notify();
		
	}
	
}
public class Waiting_WaitNotify_2 {
	public static void main(String[] args) {
		DataBox dataBox = new DataBox();
		Thread t1 = new Thread() {
			public void run() {
				for(int i = 1 ; i < 9 ; i++) {
					dataBox.inputdata(i);
				}
			};
		};
		
		Thread t2 = new Thread() {
			public void run() {
				for(int i = 1 ; i < 9 ; i++) {
					dataBox.outputData(i);
				}
			};
		};
		
		t1.start();
		t2.start();
	
	}
}