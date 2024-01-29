package chapter17;

public class WorkThreadB extends Thread{
	
	private WorkObject workObj;
	
	public WorkThreadB(WorkObject workObj) {
		setName("B스레드");
		this.workObj = workObj;
	}

	@Override
	public void run() {
		for(int i=0;i<10;i++) {
			workObj.method();
		}
		System.out.println("스레드 B 작업 종료");
	}
}
