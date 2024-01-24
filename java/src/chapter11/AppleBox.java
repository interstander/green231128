package chapter11;

public class AppleBox {

	private Apple ap;
	
	public void set(Apple ap) {  // 사과를 상자에 저장하기
		this.ap = ap;
	}
	
	public Apple get() {   // 사과를 상자에서 꺼내기
		return ap;
	}
	
}
