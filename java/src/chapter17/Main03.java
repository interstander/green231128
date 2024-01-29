package chapter17;

public class Main03 {

	public static void main(String[] args) {
		// 인터페이스(Runnable)구현을 통한 멀티스레드 구현
//		DingDong02 d = new DingDong02();
//		Thread thread = new Thread(d);
//		thread.start();
		
		Thread thread = new Thread(new Runnable() {
			@Override
			public void run() {
				// 또다른 실행 흐름의 main
				for(int i=0;i<5;i++) {
					System.out.println("동");
					
					try {
						Thread.sleep(1000); // 실행 흐름을 1초 지연
					} catch (InterruptedException e) {
						e.printStackTrace();
					}
					
				}
			}
		});
		thread.start();// 새로만든 스레드 동작
		
		
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
