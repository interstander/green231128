package chapter14;

public class Main01 {

	public static void main(String[] args) {
//   => 클래스 A의 내부 클래스를 클래스A 외부에서 사용하는 방법
		// 인스턴스 멤버 클래스 B의 인스턴스를 만들기 위해서
//		B b= new B();

		//외부 클래스인 A의 인스턴스가 있어야 한다.
		A a = new A();
		
		A.B b = a.new B();      // 예)    Map.Entry<키,밸류> 
//      A클래스의 멤버로서 B라는 타입
		b.fieldB1= 10;
		b.methodB1();
		
	// B 클래스 내부의 정적 멤버
		A.B.fieldB2 =100;
		A.B.methodB2();
		
//------------------------------------------------------------------------
		// 정적 멤버 클래스 C의 인스턴스를 만들기 위해서
		A.C c = new A.C();
		
	//  C 클래스 내부의 멤버
		c.fieldC1 = 10;
		c.methodC1();
		
	//  C클래스 내부의 정적 멤버
		A.C.fieldC2=10;
		A.C.methodC2();
		
//------------------------------------------------------------------------
		a.methodA();	
		
		a.methodA4(10);
		
		
	}

}















