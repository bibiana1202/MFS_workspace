package sec05_threadstates.EX06_Waiting_WaitNotify_1;

class DataBox{
	int data;
	synchronized void inputdata(int data) {
		this.data= data;
		System.out.println("입력 데이터: "+data);
	}
	synchronized void outputData(int data) {
		System.out.println("출력 데이터: "+data);
	}
	
}

public class Waiting_WaitNotify_1 {
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
