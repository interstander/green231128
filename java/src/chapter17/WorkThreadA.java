package chapter17;

public class WorkThreadA extends Thread{
	
	private WorkObject workObj;
	
	public WorkThreadA(WorkObject workObj) {
		setName("A스레드");
		this.workObj = workObj;
	}

	@Override
	public void run() {
		for(int i=0;i<10;i++) {
			workObj.method();
		}
		System.out.println("스레드 A 작업 종료");
	}
	
	
	
}
