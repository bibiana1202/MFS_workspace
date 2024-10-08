package mysrc;

import oop3.Dice; // dev/mylib/mydice.jar import 함.

public class MyPrg {
	public static void main(String[] args) {
		Dice dice = new Dice();
		System.out.println(dice.getNumber());
	}
}
