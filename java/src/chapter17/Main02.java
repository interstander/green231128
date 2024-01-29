package chapter17;

public class Main02 {

	public static void main(String[] args) {
		// 클래스(Thread)상속을 통한 멀티스레드 구현
		
		Thread thread = new DingDong01();
		thread.start();// 또다른 메인 메서드를 실행
		
		
		for(int i=0;i<5;i++) {
			System.out.println("띵");
			try {
				Thread.sleep(1000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
		}

	}

}
