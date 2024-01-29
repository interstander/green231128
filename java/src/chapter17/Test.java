package chapter17;

public class Test extends Thread{

	public Test(String name) {
		setName(name); // 스레드에 이름을 부여하는 메서드
	}
	
	@Override
	public void run() {
		for(int i=0;i<200000000;i++) {
			
		}
		System.out.println(getName()); // 저장된 스레드 이름을 꺼내오는 메서드
	}

	
}
