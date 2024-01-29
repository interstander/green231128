package chapter17;

public class Calc {  // 서로다른 두 스레드가 사용할 객체
	private int memory;

	public int getMemory() {
		return memory;
	}

	//public void setMemory(int memory) {  // 일반적인 메서드 : 여러 스레드가 같이 사용
	public synchronized void setMemory(int memory) {
		//   => 한번에 하나의 스레드만 사용가능
		
		synchronized (this) {  //코드 블록을 두고 동기화 기능 동작
			// 공유 객체 calc의 참조 대상 자체가 잠금상태
			//    실행코드가 동기화블록에 들어가면 객체가 통으로 잠김상태
		}
		this.memory = memory;
		
		try {
			Thread.sleep(1000);
		} catch (InterruptedException e) {
			e.printStackTrace();
		}
		
		System.out.println(Thread.currentThread().getName()+" : "+this.memory);
							//   현재 실행중인 스레드의 이름 출력
	}
	
	
}
