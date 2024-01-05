package chapter04;

public class Jump01 {

	public static void main(String[] args) {
		// 점프문 => 중단 : 여기까지 진행하고 다음 처리를 해라!!
		//   break, continue, return, 
		
		//  break, continue : 반복을 '중단'
		//     - break : 반복을 빠져 나와라!
		//     - continue : 조건을 다시 확인해라!
		
		System.out.println("1부터 5까지 출력하세요");
		for(int i=1;i<=5;i++) {
			System.out.println(i); 
		}
		
		System.out.println("1부터 5까지 출력하되 3이 될 때 끝내고 빠져나오세요.");
		for(int i=1;i<=5;i++) {
			if(i==3) {
				break;
			}
			System.out.println(i); 
		}
		
		System.out.println("1부터 5까지 출력하되 3이면 다시 조건을 확인하세요.");
		for(int i=1;i<=5;i++) {
			if(i==3) {
				continue;
			}
			System.out.println(i); 
		}
		
		// [주의 사항]
		// 
		// 반복이나 조건문:
		//   반복되는 코드블록, 조건을 충족될때 실행할 코드블록 => { }
		//   코드블록의 내용이 실행문 한줄인 경우 {}를 생략할 수도 있다.
		
		System.out.println("1부터 5까지 출력하세요");
		for(int i=1;i<=5;i++) System.out.println(i); 
		
		int score = 60;
		if(score>=60) System.out.println("합격");
		
		//  for();{~~~}
		
		
		
		
		
		
		
		
		
		
		
	}

}
