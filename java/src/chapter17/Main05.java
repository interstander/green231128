package chapter17;

public class Main05 {

	public static void main(String[] args) {
		// yield메서드
		
		ThreadA thA = new ThreadA();
		ThreadB thB = new ThreadB();
		
		System.out.println("A,B 스레드 동시 시작!");
		thA.start();
		thB.start();
		
		try {
			Thread.sleep(1000); // 약 1초간 A,B스레드가 동시 동작
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		thA.work = false;
		System.out.println("A 스레드 작업 정지");
		
		try {
			Thread.sleep(500); // 약 0.5초간 B스레드만 동작
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		thA.work = true;
		System.out.println("A 스레드 작업 제시작");
		
		try {
			Thread.sleep(1000); // 약 1초간 A,B스레드가 동시 동작
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		thA.stop = true;  // A,B 스레드 작업 종료 
		thB.stop = true;
		

	}

}
