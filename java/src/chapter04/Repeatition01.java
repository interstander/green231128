package chapter04;

public class Repeatition01 {

	public static void main(String[] args) {
		// 반복문1 - while
		//   반복문 : 똑같은 / 비슷한 코드가 반복될 때 사용하는 코드 작성 방법
		//    while은 if문과 똑같이 생겼다.
		// 
		//  10이라는 숫자를 10번 출력해 봅시다.
		System.out.println("10이라는 숫자를 10번 출력하세요.");
		
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
//		System.out.println(10);
		
		int cnt1 = 1;  // 개수를 세기 위한 변수
		
		while(cnt1 <= 10) {  // 개수가 10이 될때 까지
			System.out.println(10);
			cnt1++;  // 개수 세기
		}
		
		System.out.println("1부터 10까지 출력해 봅시다.");
//		System.out.println(1);
//		System.out.println(2);
//		System.out.println(3);
//		System.out.println(4);
//		System.out.println(5);
//		System.out.println(6);
//		System.out.println(7);
//		System.out.println(8);
//		System.out.println(9);
//		System.out.println(10);
		
		int cnt2 = 1;  // 개수를 세기 위한 변수
		
		while(cnt2 <= 10) {  // 개수가 10이 될때 까지
			System.out.println(cnt2);
			cnt2++;  // 개수 세기
		}
		
		System.out.println("위 예제를 do~while로 출력");
		
		int cnt3 = 1;
		do {
			System.out.println(cnt3);
			cnt3++;
		}while(cnt3 <= 10);
		
		System.out.println("1부터 10까지의 합계를 구하는 반복을 만들어 봅시다.");
		// 합계 => 누적
		int sum = 0;  // 합계를 누적시킬 변수
		int cnt4 = 1;
		
		while(cnt4 <= 10) {
			sum += cnt4;  // [{(0+1)+2}+3]+...
			cnt4++;
		}
		
		System.out.println("합계 : "+sum); 
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
