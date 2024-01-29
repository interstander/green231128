package chapter17;

public class User01 extends Thread{
	
	private Calc calc;

	public void setCalc(Calc calc) {
		setName("User01");
		this.calc = calc;
	}

	@Override
	public void run() {
		calc.setMemory(100);
	}
	
	
	
	
}
