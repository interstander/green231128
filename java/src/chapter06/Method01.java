package chapter06;

import java.util.Scanner;

public class Method01 {
	
	public static int check1 = 0;  // 모든 메서드가 공용으로 사용하는 변수
	public static int check2 = 0; 

	public static void main(String[] args) {
		// 메서드 : 전체의 코드를 기능 별로 묶어주는 '기능 덩어리'
		//  자바스크립트 :  함수내 또 다른 함수를 만드는 것이 가능하다
		//  자바에서는 메서드내에 또다른 메서드 만드는 것이 불가능!
		
		
		//  메서드의 생김새     => 이름(){}  / 이름();
		//  :   타입 이름(){~~~}
		
//		System.out.println("안녕하세요!");
//		Scanner scan = new Scanner(System.in);
//		scan.nextLine();
		
		// 메서드의 요소
		//  1. 이름 => 이름짓는 방법은 변수와 똑같다!
		//  2. 매개변수 
		//		   => 메서드를 동작시키기 위해서 외부로부터 주입되는 데이터(매개값, 인자)
		//		   => 메서드 내부에서 매개값을 저장하기 위해서 사용하는 변수 : 매개변수
		//  3. 반환값 
		//         => 메서드가 동작된 후 생겨나는 결과물(반환데이터, 반환(리턴)값)
		//         => 반환 데이터를 메서드가 호출(사용)된 위치로 될돌려 보내는 것 :  반환(리턴)
		//         => 반환값의 데이터 타입을 메서드이름 앞에 작성
		//         => 메서드 내부에 ' return 반환데이터;' 
		//		   => 만약 반환되는 데이터가 없다면 반환 타입을 'void'라고 작성
		//         => 메서드 내부에서 'return'을 만나면 그 즉시 메서드를 종료! 

		int num1 = 10;
		int num2 = 20;
		int result = adder(num1,num2);
		System.out.println("계산 결과 : "+result);
		
		// 메서드의 종류
		//  1) 입력 X, 출력 X : 
		bye();
		//  2) 입력 O, 출력 X :
		hello("말랑핑");
		//  3) 입력 X, 출력 O :
		int dice = rollingDice();
		System.out.println("주사위 값 : "+dice);
		//  4) 입력 O, 출력 O : adder(10,20);
		
		// 변수의 범위(scope)
		//  - 변수의 선언 : 변수이름을 사용하겠습니다. 지정!
		//  - 선언의 위치 : 변수의 사용 범위 
		//          => {...} 내부에 선언하면 {...}안에서만 사용이 가능하다.
		//               => {...} 외부에서는 사용이 불가능하다.
		int i=0;
		for(i=0;i<5;i++) {
			System.out.println("데이터 : "+i);
		}
		
		System.out.println("데이터 : "+i);  
		// i는 for반복문 내부에 선언한 변수이므로 for반복문 외부에서는 사용 불가
		
		check1 = 10;
		
		
		//  메서드 오버로딩 (X ==> 메서드 오버라이딩[상속])
		//  메서드의 목적!! => '기능'의 분리
		
		//  하나의 기능에 하나의 메서드 ~~
		//    => 매개 데이터에 따라서 같은 기능을 수행하는 다른 메서드가 필요
		// 예 : 사각형의 넓이 구하는 메서드 : rectangleArea(가로, 세로);
		//       -> 만들어진 메서드는 가로세로가 정수일때만 사용 가능
		
		//       -> 가로세로가 실수일 때 넓이 구하는 메서드를 만들어야 한다. rectangleArea2(가로, 세로);
		
		//  => 하나의 기능에 하나의 메서드 이름을 부여하고자 하는 원칙!
		//     메서드 오버로딩을 사용한다.
		//              -> 여러 메서드를 하나의 이름으로 묶어서 처리하는 방법
		
		// 메서드를 같은 이름으로 사용하지만 구분할 수 있는 기준이 있어야 한다.
		//    => 매개변수
		//       - 매개변수의 타입
		//       - 매개변수의 개수
		//       - 매개변수의 순서  
		//             (String name, int age) 
		//             (int num, String title)
		
		//   반환 타입은 전혀 중요하지 않다.
		
		// 대표적예제
		System.out.println();
		System.out.println("안녕");
		System.out.println(12);
		System.out.println(3.14);
		System.out.println(true);

		
	}
//	public static double rectangleArea2(double w, double h) {
	
	public static double rectangleArea(double w, double h) {
		return w*h;
	}
	
	public static double rectangleArea(int w, int h) {//직사각형 넓이
		return w*h;
	}
	
	public static int rectangleArea(int w) {  //정사각형 넓이
		return w*w;
	}
	
	
	
	
	//public static int check1 = 0;
	//public static int check2 = 0;
	
	
	public  void test() {
		int check2 = 10;
		System.out.println("check1 : "+check1);
		System.out.println("check2 : "+check2);
	}
	
	
	
	public static void bye() {
		System.out.println("잘자요!!");
	}
	public static void hello(String name) {
		System.out.println("안녕하세요 제 이름은 "+name+"입니다.");
	}
	public static int rollingDice() {
		int dice = (int)(Math.random()*6)+1;
		return dice;
	}
	
	
	
	public static int adder(int a, int b) {
		int c = a+b;
	
		return c;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
