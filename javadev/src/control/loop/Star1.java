package control.loop;

public class Star1 {
	public static void main(String[] args) {
		for(int i = 1 ; i <=5 ; i++) {
			for(int j=1 ; j<=5 ; j ++) {			
				if(6-i >= j)	
					System.out.print("*");				
			}
			System.out.println("");
		}
	}
}
