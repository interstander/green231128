package chapter17;

public class Main08 {

	public static void main(String[] args) {
		WorkObject workObj = new WorkObject();
		
		WorkThreadA a = new WorkThreadA(workObj);
		WorkThreadB b = new WorkThreadB(workObj);
		
		a.start();
		b.start();
		
		
	}

}
