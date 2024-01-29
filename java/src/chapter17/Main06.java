package chapter17;

public class Main06 {

	public static void main(String[] args) {

		Sum01 sumThread = new Sum01();
		sumThread.start();
		
		try {
			sumThread.join(); // sumThread가 종료될때 까지 main스레드를 실행대기
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println("1부터 1000까지의 합 : "+sumThread.getSum()); 
		

	}

}
