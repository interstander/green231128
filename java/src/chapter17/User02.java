package chapter17;

public class User02 extends Thread{
	private Calc calc;

	public void setCalc(Calc calc) {
		setName("User02");
		this.calc = calc;
	}

	@Override
	public void run() {
		calc.setMemory(50);
	}
}
