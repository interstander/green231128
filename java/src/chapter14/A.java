package chapter14;

public class A {  // 내부 클래스를 포함하는 외부 클래스 A
	public A() {
		System.out.println("A 인스턴스 생성됨");
	}
	
	//  네스티드 클래스의 종류
	//  1. 인스턴스 멤버 클래스
	//  2. 정적 멤버 클래스 : static
	//  3. 로컬(지역:local) 클래스
	
	// 인스턴스 멤버 클래스 :  B =>  new B();
	class B{
		public B() { // 생성자 
			System.out.println("B 인스턴스 생성됨");
		}
		// 멤버클래스 B의 멤버
		int fieldB1;
		void methodB1() {}
		
		static int fieldB2;
		static void methodB2() {}

	}
	// 정적 멤버 클래스
	static class C{
		public C() {// 생성자 
			System.out.println("C 인스턴스 생성됨");
		}
		// 정적 멤버클래스 C의 멤버
		int fieldC1;
		void methodC1() {}
		
		static int fieldC2;
		static void methodC2() {}
	}
	
	// 로컬 클래스   (로컬 변수-> 메서드 내부에 선언된 변수)
	void methodA() { // 외부 클래스인 A의 멤버 메서드
		class D{ // 메서드 내부에 선언된 클래스
			public D() {//생성자
				System.out.println("D 인스턴스 생성됨");
			}
			// 로컬클래스 D의 멤버
			int fieldD1;
			void methodD1() {}
			
			static int fieldD2;
			static void methodD2() {}
		}
		// 로컬 클래스는 메서드 내부에 선언이 되고
		//  메서드 내부에서 인스턴스 만들고 사용가능 => 외부 클래스A 밖에서는 사용 불가
		D d = new D();
		d.fieldD1 = 10;
		d.methodD1();
		D.fieldD2=10;
		D.methodD2();
		
	}
	
//------------------------------------------------------------------------------------
	// A클래스(외부클래스) 의 멤버의 영역
	// 1. 외부 클래스의 멤버 필드로서 내부클래스의 인스턴스를 사용할 수 있는가?
	B b1 = new B();
	C c1 = new C();
//	D d1 = new D();
	
	// 2. 외부 클래스의 정적 멤버 필드로서 내부 클래스의 인스턴스를 사용할 수 있는가?
//	static B b2 = new B();
	static C c2 = new C();
//	static D d2 = new D();
	
	// 3. 외부 클래스의 멤버 메서드에서 내부 클래스의 인스턴스를 사용할 수 있는가?
	void method1() {
		B b3 = new B();
		C c3 = new C();
//		D d3 = new D();
		b3.methodB1();
	}
	
	// 4. 외부 클래스의 정적 멤버 메서드에서 내부 클래스의 인스턴스를 사용할 수 있는가?
	static void method2() {
//		B b3 = new B();
		C c3 = new C();
//		D d3 = new D();
	}
	
//-------------------------------------------------------------------------
	// 인스턴스 멤버 클래스가 외부 클래스의 멤버를 사용할 수 있는가?
	int fieldA1;
	void methodA1() {}
	static int fieldA2;
	static void methodA2() {}
	
//  1. 인스턴스 멤버 클래스가 외부 클래스의 멤버 사용
	class B2{
		void methodB2() {
			fieldA1 = 10;
			methodA1();
			fieldA2 = 20;
			methodA2();
		}
	}
//  2. 정적 멤버 클래스가 외부 클래스의 멤버 사용
	static class C2{
		void methodC2() {
//			fieldA1 = 10;
//			methodA1();
			fieldA2 = 20;
			methodA2();
		}		
	}

//	3. 로컬 클래스가 외부 클래스의 멤버 사용
	void methodA3() {
		class D3{
			void methodD3() {
				fieldA1 = 10;
				methodA1();
				fieldA2 = 20;
				methodA2();
			}
		}
	}
	
//-----------------------------------------------------------
	// 로컬 클래스 => 메서드 내부에 선언된 클래스
	//   로컬변수, 매개변수는 로컬 클래스 내부에서 사용할 수 있는가? 
	//      => 사용할수 없다! (O)
	//      => [예외] 로컬클래스의 인스턴스가 만들어지는 시점에 복사해서 사용
	//                                              => 변경 불가능한 로컬변수와 매개변수만 복사 가능
	
	void methodA4(final int age) {
				//   매개변수
		final String name = "로컬변수";
		//name = "변경";
		class D4{
			void methodD4() {
//				age = 12;
				System.out.println(name); // final이 붙어있다고 간주!!
				System.out.println(age);
			}
		}
		
		D4 d = new D4(); // 힙 영역
		d.methodD4();
	}
	
	
	
	
	
	
}











