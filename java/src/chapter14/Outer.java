package chapter14;

public class Outer {
	String name;// 인스턴스 멤버 변수
	void method() {
		String name; // 로컬 변수
		
		name = "로컬";  // 로컬 변수
		this.name = "인스턴스 멤버" ;  // 인스턴스 멤버
		
		this.method2();
	}
	
	private void method2() {}
	
	class Inner{
		String name;  // 내부 클래스의 인스턴스 멤버 변수
		void method() {
			String name;  // 내부 클래스의 로컬 변수
			
			name = "로컬";  // 내부 클래스의 로컬 변수
			this.name = "인스턴스"; // 내부 클래스의 인스턴스 멤버
			
			// 외부 클래스의 인스턴스 멤버 변수를 사용하는 방법
			Outer.this.name = "외부클래스의 멤버 변수";
		}
	}
}




