package chapter17;

public class Main07 {

	public static void main(String[] args) {
		// Calc라는 객체에 서로다른 두 스레드가 접근해서 사용하는 예제
		//   User01은 100을 저장후 출력할 예정
		//   User02는 50을 저장후 출력할 예정
		
		// 그런데 하나의 메서드에 서로다른 두 스레드가 사용함으로
		//   데이터의 변질이 발생   => [해결] 동기화 기능
		//   User01이 100을 저장했으나 50이 출력
		
		Calc calc = new Calc();
		
		User01 u1 = new User01();
		u1.setCalc(calc);
		u1.start();  // calc에 100을 저장하고 출력
		
		User02 u2 = new User02();
		u2.setCalc(calc);
		u2.start();// calc에 50을 저장하고 출력
	}

}
