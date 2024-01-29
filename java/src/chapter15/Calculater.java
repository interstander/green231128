package chapter15;

public class Calculater {

	private int num1;
	private int num2;
	
	public Calculater(int num1, int num2) {
		System.out.println("num1 : "+num1+", num2 : "+num2+"가 입력되었습니다.");
		this.num1 = num1;
		this.num2 = num2;
	}
	
	public int instanceMethod(int num1, int num2) {
		return num1+num2;
	}
	
	public static int staticMethod(int num1, int num2) {
		return num1*num2;
	}
	
}
