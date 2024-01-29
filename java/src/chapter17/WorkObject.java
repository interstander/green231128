package chapter17;

public class WorkObject {
	
	public synchronized void method() {
		System.out.println(Thread.currentThread().getName()+" : 작업 진행");
		notify(); // 일시정지 중인 스레드가 실행대기 상태로 전환
		
		try {
			wait(); // 실행중인 스레드가 일시정지로 전환
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
	}

}
