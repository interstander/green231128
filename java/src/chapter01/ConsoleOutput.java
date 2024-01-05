package chapter01;

public class ConsoleOutput {
	public static void main(String[] args) {
		// 기본 콘솔(터미널,명령프롬프트...) 출력문!!
		
		System.out.print("기본 콘솔출력 \n"); // 기본 문자열을 출력한다.
		System.out.print(100);    // 숫자 출력 가능
		System.out.print(100+200);  // 숫자 연산후 출력 가능
		System.out.print(500+"600\n");   // 숫자와 문자열 결합 => 문자 형태로 결합
//		System.out.print();  // 출력할 내용이 없는 경우 에러
		
		// 특수문자 
		//   \n  : 키보드의 엔터키
		//   \t  : 키보드의 탭키
		//   \b  : 백스페이스 (이클립스에서는 작동 안함)
		//   \\  : \기호 표시
		
		System.out.println("기본 콘솔출력 + 줄바꿈");
		System.out.println("안녕하세요");
		System.out.println();   // 기본 줄바꿈이 출력되므로 에러 안남
		
		
	}
}
