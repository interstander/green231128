package chapter04;

public class Repeatition02 {

	public static void main(String[] args) {
		// 반복문 2 - for 반복문
		//   숫자 셀 변수, 중단할 조건, 증감식이 한곳에 보이도록 작성하는 반복문 :for
		//  - for문 반복 진행 순서
		//    1) 변수 선언 및 초기화
		//    2) 조건 확인(회수 도달 여부를 확인)
		//    3) 실행 영역 실행
		//    4) 증감식
		//    5) 다시 조건 확인
		//    6)  3~5번 과정 반복
		//    7) 조건이 false가 되면 반복 중단
		
		
		// 10이라는 숫자를 10번 출력
		System.out.println("10이라는 숫자를 10번 반복");
		for(int i=1;i<=10;i++) {
			System.out.println(10);
		}
		
		
		//  1부터 10까지 숫자를 출력
		System.out.println("1부터 10까지 숫자 출력");
		for(int i=1;i<=10;i++) {
			System.out.println(i);
		}
		
		

	}

}
