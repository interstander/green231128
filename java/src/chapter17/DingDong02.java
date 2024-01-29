package chapter17;

public class DingDong02 implements Runnable{

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

}
