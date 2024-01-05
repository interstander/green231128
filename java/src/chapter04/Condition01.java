package chapter04;

import java.util.Scanner;

public class Condition01 {

	public static void main(String[] args) {
		// 조건문 1 - if
		//   T/F가 나오는 조건식으로 보고
		//   코드를 분기하는 조건문
		
		int score1 = 55;
		if(score1 >= 60) {
			// 조건이 true일 때 실행되는 영역
			System.out.println("합격");
			System.out.println("자격증을 수여합니다.");
		}else {
			// 조건이 false일 때 실행되는 영역
			System.out.println("불합격");
		}
		
		System.out.println("프로그램을 종료합니다.");
		
		System.out.println("--------------------------------------------");
		
		var age = 30;
//      var 타입 : JDK 10 버전 이후로 사용 가능
//                데이터가 입력될 떄 타입을 결정하는 방식  (= 자바스크립트와 유사)
		
		if(age >= 65){
			System.out.println("노약자 무료");
		}else if(age >= 20){
			System.out.println("성인 요금");
		}else if(age >= 13){  // 13세 이상  (20세 미만)
			System.out.println("청소년 요금");
		}else if(age >= 8){
			System.out.println("어린이 요금");
		}else{
			System.out.println("유아 무료");
		}
		System.out.println("--------------------------------------------");
//  if 조건 사용
//  점수를 입력받아서 90점 이상이면 A등급, 
//		  80점 이상이면 (90점 미만) B등급
//		  70점 이상이면 C등급
//		  60점 이상이면 D등급
//		  60점 미만이면 F등급
		Scanner s = new Scanner(System.in);
		// 컨트롤+시프트+O : 자동 임포트
		
		System.out.println("점수를 입력해 주세요");
		System.out.print(">>");
		
		int inputScore = Integer.parseInt(s.nextLine());  // "12384"
		//                    숫자형태의 문자열을 숫자로 변환
		//               Double.parseDouble(문자열);  실수형태의 문자열을 실수로 변환
		String grade = "";
		
		if(inputScore >= 90) {
			grade = "A등급";
		}else if(inputScore >= 80) {
			grade = "B등급";
		}else if(inputScore >= 70) {
			grade = "C등급";
		}else if(inputScore >= 60) {
			grade = "D등급";
		}else {
			grade = "F등급";
		}
		
		System.out.println("당신의 점수 : "+inputScore);
		System.out.println("당신의 등급 : "+grade+"입니다.");
		

		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
