package chapter07;

public class FinalMain {
	
	int a = 10;
	void method() {
		System.out.println("인스턴스 메서드");
	}

	final static String M_NUM_DATA = "상수";  //
	// 모두가 공유하지만 절대 바꿀수 없는 값 : 상수
	//  상수는 이름을 다르게 작성 => 모두 대문자원칙, 스네이크케이스
	
	final String greet;  //  인스턴스마다 다른 값을 가질수 있다.
						//  초기화시 변경은 불가능
	
	//FinalMain(){}
	FinalMain(String greet){
		this.greet = greet;
	}
	
	public static void main(String[] args) {
		FinalMain fm = new FinalMain("안녕하세요");
		fm.method();

		// 키워드 : final
		//  final => '최종적인' => 더이상 바꿀수 없는
		
		//  변수, 메서드, 클래스 모두에 final키워드를 붙일수 있다.
		
//		fm.greet = "반갑습니다";
		

	}

}
