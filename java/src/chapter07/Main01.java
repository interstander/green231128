package chapter07;

public class Main01 {

	public static void main(String[] args) {
		// 케릭터를 생성해 봅시다.
		GameChar warrior = new GameChar();
		//   GameChar() => 메서드
		//   new  => 클래스를 통해서 인스턴스를 만드는 연산자
		// GameChar 참조타입
		//  new GameChar(); => 만들어진 참조데이터
		//  warrior => 참조 변수
		
		warrior.skill1();
		//     .  =>  멤버접근연산자
		warrior.str = 10;
		
		GameChar warrior2 = new GameChar("마법사");
		warrior2.skill2();
		warrior2.str = 7;
		
		System.out.println("케릭1의 힘 : "+warrior.str);
		System.out.println("케릭2의 힘 : "+warrior2.str);
		
		//------------------------------------------------
		//  케릭터의 직업을 선택!!
		//  케릭터를 선택할 때 직업을 고르도록 하고 싶다!!
		//            초기화
		
		//    데이터를 초기화 할 때 사용하는 메서드 존재
		//   GameChar();  <=  데이터 초기화시 사용하는 메서드 (생성자)
		//  생성자 특징
		//   - 인스턴스가 만들어질 때 딱 한번만 실행되는 메서드
		//       (임의로 실행 불가능)
		//   - 반환값이 존재하지 않는다, 반환타입도 작성하지 않는다.
		//   - 생성자메서드의 이름은 반드시 클래스이름과 똑같이 작성해야한다.
		//   - 생성자 없는 클래스는 존재하지 않는다.
		//     (생성자를 만들지 않으면 기본 생성자를 자동으로 생성)
		
		// 생성자의 역할
		//  1. new 연산자와 함께 인스턴스를 만드는 역할
		//  2. 새로 생성된 인스턴스 내부의 멤버변수를 초기화
		
		
		//-------------------------------------------------------
		// 각각의 인스턴스는 독립적인 존재
	
		// 모든 인스턴스가 공유하는 정보  => 정적(static) 정보
		//   언어, 패치버전
		
		System.out.println("케릭터1의 언어 : "+warrior.lang);
		System.out.println("케릭터2의 언어 : "+warrior2.lang);
		
		warrior.lang = "아랍어";  // 특정 인스턴스에서 직접 변경(X)
		
		System.out.println("케릭터1의 언어 : "+warrior.lang);
		System.out.println("케릭터2의 언어 : "+warrior2.lang);
		
		GameChar.lang = "한국어"; // 클래스 이름을 통해서 변경(O)
		GameChar.setLang("한글");  
		
		//정적 멤버의 가장 중요한 특징
		// 인스턴스가 없어도 사용이 가능!!
		
		//  =>  
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
