package chapter15;

public class Main04 {

	public static void main(String[] args) {
		// 메서드 참조 :  람다식의 기능이 다른 메서드를 그대로 가져다 쓰는 경우
		//   1) 정적 메서드를 참조하는가?
		//   1) 일반 인스턴스 메서드를 참조하는가?
		//   3) 생성자 메서드를 참조하는가?

		Ex04Interface ex04;
		
		// 1) 정적 메서드 참조
		//    일반적인 람다식 메서드 참조
		ex04 = (x,y)->{return Calculater.staticMethod(x, y);};
		System.out.println("정적 메서드 참조 결과 : "+ex04.method(3, 5));// 15
		
		//     람다식을 메서드 참조 방식으로 생략 한 경우
		ex04 = Calculater :: staticMethod;
		System.out.println("정적 메서드 참조 결과 : "+ex04.method(7, 9)); // 63
		
		// 2) 인스턴스 메서드 참조
		Calculater cal = new Calculater(2, 7);
		
		//    일반적인 람다식 메서드 참조
		ex04 = (x,y)->{return cal.instanceMethod(x, y);};
		System.out.println("인스턴스 메서드 참조 결과 : "+ex04.method(3, 5)); // 8
		
		//	     람다식을 메서드 참조 방식으로 생략 한 경우
		ex04 = cal :: instanceMethod;
		System.out.println("인스턴스 메서드 참조 결과 : "+ex04.method(7, 9)); // 16
		
		//  3) 생성자 메서드 참조
		//    생성자 메서드의 반환데이터 => 인스턴스 데이터
		Ex05Interface ex05;
		
		//	    일반적인 람다식 메서드 참조 
		ex05 = (x,y)->{return new Calculater(x, y);};
		Calculater cal2 = ex05.method(3, 5);
		
		//	     람다식을 메서드 참조 방식으로 생략 한 경우
		ex05 = Calculater :: new;
		Calculater cal3 = ex05.method(7, 9);
		
		
		
		
		
		

	}

}
