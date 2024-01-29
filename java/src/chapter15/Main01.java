package chapter15;

public class Main01 {

	public static void main(String[] args) {
		Member m1 = new Member();
		m1.method1();  // Member클래스
		
		// 원하는 상황 
		// => 1) method1() 사용은 하고 싶다.
		// => 2) 튜닝해서 사용하고 싶다.
		//            => 오버라이드 
		Member m2 = new Student();
		m2.method1(); // Student 클래스
		
	//
		Member m3 = new Member() {
						int age;
						void method2() {}
					//  정체 => Member클래스를 상속받은 자식 인스턴스
						
						@Override
						void method1() {
							System.out.println("익명 자식 클래스");
						}	
					};
		
//		m3.age = 10;
//		m3.method2();
		m3.method1();  // 익명 자식 클래스
					
		method(new Student());
		method(new Member() {
			@Override
			void method1() {
				System.out.println("즉석에서 만들어진 메서드");
			}
		});
		
	// 익명 클래스란 필요한 기능을 즉석에서 만들어 넣어줄 때 사용하는 용도
	// 익명 자식 클래스보다 익명 구현 클래스 더 많이 사용한다.
		Remocon remocon = new Remocon() {

						@Override
						public void on() {
							System.out.println("에어컨 켜기");
						}
			
						@Override
						public void off() {
							System.out.println("에어컨 끄기");
						}
						
					};
		remocon.on();
		remocon.off();
		
		tvController(new Remocon() {

						@Override
						public void on() {
							System.out.println("티비 켜기");
						}
			
						@Override
						public void off() {
							System.out.println("티비 끄기");
						}
						
					});
		
		
	}

	private static void tvController(Remocon r) {
		r.on();
		r.off();
		
	}

	private static void method(Member m) { //  다른 언어와 통신기능
//		if(m이 파이썬과 연결되는 객체) {
//			m.파이썬();
//		}else if(m 코틀린과 연결되는 객체) {
//			m.코틀린();
//		}
		m.method1();
	}

}











