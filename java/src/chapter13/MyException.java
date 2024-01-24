package chapter13;

public class MyException extends Exception{
	// 사용자 정의 예외 클래스
	//  - 일반예외 : Exception을 상속받아서 만들고
	//  - 실행예외 : RuntimeEception을 상속 받아서 만들면 된다.
	
	
	public MyException() {}
	public MyException(String msg) {// 예외 발생 이유을 저장해야 상황이 필요한 경우
		super(msg); // 예외 발생 이유 보관
	}
}
