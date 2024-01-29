package chapter17;

public class ThreadA extends Thread{

	public boolean stop = false;
	public boolean work = true;
	@Override
	public void run() {
		while(!stop) { // stop이 true가 되면 while문 종료
			
			try {
				Thread.sleep(200);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
			if(work) {
				System.out.println("AAA");
			}else {
				Thread.yield();  // work가 false면 다른 스레드에 실행을 양보
			}
		}
		
		System.out.println("A 스레드 종료");
	}
	
	
}
