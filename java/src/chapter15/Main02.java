package chapter15;

public class Main02 {

	public static void main(String[] args) {
		// 람다식 : 함수형 언어의 특성을 자바에 도입한 기능
		// 수많은 데이터를 분석
		//  기존의 객체지향 =>  함수형 방식
		
		//  함수의 데이터화!
		//   자바스크립트 예
		//   let aa = function(){...}

		// 자바에서 비슷하게 구현하고 싶다~
		//  타입 변수 = 메서드(){...}
		
		// 문제 : 자바의 기본 구성요소는 클래스
		//            -> 메서드는 클래스의 멤버
		
		// 해결법 : 익명 구현 객체
		Runable runable = new Runable() {
			@Override
			public void run() {

			}
		};
		runable.run();
		// 가장 쉬운 방식 :  인터페이스를 구현한 클래스를 생성
		method(new RunableClass());
			
		// 주 목적은 어떤 기능을 수행하는데 매개값으로 핵심기능을 인자로 전달하고 싶을 때
		method(new Runable() {
			@Override
			public void run() {
				System.out.println("만들어진 기능");
			}
		});
		
		// 익명 구현 객체를 최대한 간소화해서 만든 것이 람다식
		// 가장 간결한 방식
		method(()->{System.out.println("람다식출력");});  // 자바스크립트: 화살표함수  ()=>{}
		// 기능을 만들어 넣어주는 것
		
		// 람다식은 최대한 간결하게 기능을 만들어 넣어주는 것
		// 람다식은 인터페이스 타입의 익명구현객체를 생성
		//  람다식에서 사용되는 인터페이스 타입 => 타겟 타입
		//  람다식은 무조건 하나의 기능만을 요구
		//         => 타겟타입은 무조건 하나의 추상메서드만을 가져야 한다.
		//      추상메서드가 하나인 인터페이스를 함수적인터페이스
		//      함수적 인터페이스인지 체크하기 위한 어노테이션 @FuntionalInterface
		
		
			
		
	}

	private static void method(Runable runable) {
		runable.run();
		
	}

}
