package chapter02;

public class Variable02 {

	public static void main(String[] args) {
		// 데이터 사용법
		//   - CRUD
		
		//  Create : 선언 = 변수를 사용하겠습니다.
		//           - 타입 변수명;
		//           초기화 = 변수에 처음 데이터를 저장하는 동작
		int javaScore,htmlScore,cssScore;
		int reactScore = 100; 
		
		//  Update : 기존에 선언된 변수에 새로 데이터를 넣는 것
		//          - 다시 선언할 필요 없음
		reactScore = 50;
		javaScore = 100;
		
		//  Read : 조회(읽기)
		
		System.out.println("리액트 점수 : "+reactScore); 
		int hapScore = reactScore + javaScore;
		
		System.out.println("합계 점수 : "+hapScore); 
		
		// Delete : X
		//    가비지 컬렉터 : 변수 데이터가 사용되지 않으면 '알아서' 지워주는 기능
		System.gc();  // 가비지 컬렉터를 호출하는 기능
		
		
		
		

	}

}
