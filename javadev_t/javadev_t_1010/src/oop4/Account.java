package oop4;

public class Account {
	static int money1;
	int money2;
	
	public Account(int money) {
		this.money1 += money;
		this.money2 += money;
	}

	@Override
	public String toString() {
		return "Account [money1=" + money1 + ", money2=" + money2 + "]";
	}
}
