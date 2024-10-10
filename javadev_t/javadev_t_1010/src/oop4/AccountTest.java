package oop4;

public class AccountTest {
	public static void main(String[] args) {
		System.out.println(Account.money1);
		
		Account ac1 = new Account(1000);
		System.out.println(ac1);
		Account ac2 = new Account(1000);
		System.out.println(ac2);
		Account ac3 = new Account(1000);
		System.out.println(ac3);
	}
}
