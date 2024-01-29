package chapter17;

public class Sum01 extends Thread{

	private long sum;

	public long getSum() {
		return sum;
	}
	@Override
	public void run() {
		for(int i=1;i<=1000;i++) { // 스레드에서 합계구하기
			sum+=i;
		}
	}

	
}
