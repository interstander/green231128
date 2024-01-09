package chapter05;

public class Array01 {

	public static void main(String[] args) {
		// 배열 : 하나의 변수에 다수의 데이터
		//      관리방법은 인덱스 번호
		
		// 1) 선언: 타입[] 변수명;
//		int[] javas;  // 숫자 데이터를 저장할수 있는 배열
		//  => int javas[];
		
		//  2) 초기화;
		int[] javas = new int[5];  			// 5칸 짜리  정수 빈 배열
		double[] javas2 = new double[5];    // 5칸 짜리  실수 빈 배열
		String[] javas3 = new String[5];    // 5칸 짜리 문자열 빈 배열
//		kjsgbdkfjs[]  klnasfd = new kjsgbdkfjs[5];  // 5칸 짜리 kjsgbdkfjs타입 빈 배열
		
		// 초기화(내용물을 배치)
		// int[] javaScores = new int[] {50,40,45,75,85}; 
		int[] javaScores = {50,40,45,75,85};  // 5칸 짜리 정수 배열
		
		System.out.println("배열 : "+javaScores);
		System.out.println();
		
		System.out.println("배열의 첫번째 데이터 : "+javaScores[0]);
		System.out.println("배열의 두번째 데이터 : "+javaScores[1]);
		System.out.println();
		
		// 배열 => [숫자]가 붙은 일반 변수처럼 활용 가능
		javaScores[0] = 80;  //기존 데이터를 덮어쓰기 가능
		System.out.println("배열의 첫번째 데이터 : "+javaScores[0]);
		
		System.out.println("배열의 첫번쨰데이터 + 두번째 데이터 : "+(javaScores[0]+javaScores[1]));
		System.out.println();
		// 정수 데이터를 인덱스 값으로 사용이 가능
		int num1 = 2;
		javaScores[num1] = 95;
		//=>  javaScores[2] = 95;
		
		System.out.println("배열의 데이터 : "+javaScores[num1]);
		System.out.println();
//------------------------------------------------------------------		
		// [응용1] 배열의 모든 데이터를 조회하는 방법
		//   반복문을 결합해서 사용가능
		for(int i=0;i<5;i++) {
			System.out.println((i+1)+"번 배열의 데이터 : "+javaScores[i]);
		}
		// ArrayIndexOutOfBound 에러 => 인덱스 범위를 벗어나서 발생하는 에러
		System.out.println();
		// 배열의 크기를 알려주는 기능 : 배열변수이름.length
		//                  => 변경 불가
		
		for(int i=0;i<javaScores.length;i++) {
			System.out.println((i+1)+"번 배열의 데이터 : "+javaScores[i]);
		}
		System.out.println();
		// 배열 + for반복문 => 공식
		// =>  for(int i=0;i<배열명.length;i++) {~~~}
		
		// 향상된 for문 (for~each문)
		//   - for반복문으로 배열의 데이터를 모두 조회
		//   [단점] : 인덱스번호를 활용할 수가 없다.
		
		//   for(타입 요소변수:배열변수){....}
		int cnt = 0;
		for(int score:javaScores) {
		//  javaScores데이터 하나씩 꺼내서 score변수에 담아서 활용
			 System.out.println((++cnt)+"번 배열의 데이터 : "+score);
		}
		
		System.out.println();
//------------------------------------------------------------------------------------
		//[응용2] 배열의 크기가 부족할 때
		//  -> 배열의 크기를 능동적으로 늘렸다 줄였다 할수 없다.
		
		//  => 데이터가 더많이 필요한 경우 배열을 늘릴수 없으므로 다음과 같은 수단을 이용한다.
		
		//  1) 더 큰 배열을 준비
		//  2) 기존의 배열을 더 큰 배열로 옮겨 담기
		
		// (***) 수업 후반부에는 배열의 단점을 극복한 컬렉션 구조를 사용함.
		
		int[] oldNum1 = {3,5,9};
		int[] newNum1 = new int[5]; // oldNum1에 있는 배열을 newNum1에 복사
		
		// 배열 단순 복사
		for(int i=0;i<oldNum1.length;i++) {
			newNum1[i] = oldNum1[i]; 
		}
		
		// 복사된 배열 출력
		for(int i=0;i<newNum1.length;i++) {
			System.out.println("새로운 배열 : "+newNum1[i]);
		}
		
		System.out.println("-----------------------------------------------");
		// 자바에는 배열을 복사하기 위한 기능을 제공한다.
		//  System.arraycopy(원본배열,원본복사 시작 인덱스,대상배열, 대상입력 시작 인덱스,복사 길이);
		
		//
		
		int[] oldNum2 = {3,5,9};
		int[] newNum2 = new int[5]; // oldNum2에 있는 배열을 newNum2에 복사
		
		System.arraycopy(oldNum2, 1, newNum2, 2,2);
		
		// [일반적 사용법]System.arraycopy(oldNum2, 0, newNum2, 0, oldNum2.length);
		
		for(int i=0;i<newNum2.length;i++) {
			System.out.println("새로운 배열 : "+newNum2[i]);
		}
		
//----------------------------------------------------------------------------------------
		//  다차원 배열 => 배열안에 데이터가 배열일 경우
		//     배열의 데이터를 그룹지어 관리하기 위해 사용하는 방법
		
//		int[] 변수  => int 데이터를 저장하기 위한 배열
//      int[][] 변수  => int[] 데이터를 저장하기 위한 배열
//      int[][][] 변수  => int[][] 데이터를 저장하기 위한 배열
		
		// 1차원 배열
		int[] arr1 = new int[5];  //  {0,0,0,0,0}
		
		// 2차원 배열
		int[][] arr2 = new int[5][];  // {배열1, 배열2, 배열3, 배열4, 배열5}
		
		arr2[0] = new int[3];  // 배열1 = {0,0,0}
		arr2[1] = new int[2];  // 배열2 = {0,0}
		arr2[2] = new int[5];  // 배열3 = {0,0,0,0,0}
		arr2[3] = new int[3];  // 배열4 = {0,0,0}
		arr2[4] = new int[4];  // 배열5 = {0,0,0,0}
		
		
//		System.out.println("배열 데이터 조회 : "+arr2[바깥쪽 인덱스][안쪽 인덱스]);
		
		
		int[][] arr3 = new int[5][3]; 
		//                =>  3칸짜리 배열을 5개 저장 가능한 배열
		
		//다차원배열의 배열길이
		System.out.println("배열 길이 : "+arr2.length);  // 가장 바깥쪽 배열의 길이 : 5
		System.out.println("배열 길이 : "+arr2[3].length); // 안쪽 3번 인덱스의 배열의 길이 : 3 
		
		// 다차원 배열의 초기화
		
		int[][] arr4 = new int[][] {{1,2,3},{4,5,6,7},{9,10,11,12,13}};
		
		int[][] arr5 = new int[][] {
						{1,2,3},    	// arr5[0]~~
						{4,5,6,7},		// arr5[1]~~
						{8,9,10,11,12}	// arr5[2]~~
		};
		
		// 반복문을 통해서 다차원 배열의 각 데이터를 조회
		for(int i=0;i<arr5.length;i++) { //바깥쪽 반복문은 바깥쪽 배열
			for(int j=0;j<arr5[i].length;j++) {
				System.out.println("배열 데이터 : "+arr5[i][j]);
			}
		}
		
		
// [마니 과제 1] 아래 점수를 배열에 담아서 합계와 평균을 구해보자
//     {78, 85, 72, 95, 86, 90}
		
// [미니 과제 2 ] 학생 수를 입력 받고 각 학생의 자바 점수를 입력받아서 총점과 평균을 출력하는 프로그램을 만들어보자
//   예시 학생수 8명
//    자바 점수 {78, 85, 72, 95, 86, 90, 75, 93 }
		
		
									
		
									
									
									
									
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
