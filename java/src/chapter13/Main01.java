package chapter13;

public class Main01 {

	public static void main(String[] args) {
		// 예외가 발생한 상황
		
		try { // 예외가 발생할 것 같은 곳을 감지하세요!
			String str = null;//new String("안녕!");
			System.out.println(str.toString());
		}catch(NullPointerException err) {
			// NullPointerException 예외가 발생해서 
			//   예외 인스턴스가 생기면 err 변수에 담아서 처리하세요!
			
			// catch() {블록} : 예외발생시 실행할 영역
			System.out.println("문자열에 데이터가 없습니다!"); 
		}
		
		System.out.println("프로그램 실행중!!");
		
//		System.out.println("5/0 : "+(5/0));
		
//		int[] nums = {1,2,3};
//		System.out.println("nums[3] : "+nums[3]);
		
//----------------------------------------------------------------
		// - catch를 두개 이상으로 여러가지 예외상황에 대비해서 코드를 작성할수 있습니다.
//		try {
//			String data = "ㅋㅋㅋ";
//			int value = Integer.parseInt(data); //예외 발생 => 숫자변경 불가
//			System.out.println(data.toString()); // 예외 발생=> null 포인터 예외
//			System.out.println("반가워요!!");
//
//		}catch(NumberFormatException e) {
//			System.out.println("숫자로 바꿀수 없는 문자열입니다!");
//		}catch(NullPointerException e) {
//			System.out.println("변수에 인스턴스가 없습니다.");
//		} 
		
//		try {
//			String data = "ㅋㅋㅋ";
//			int value = Integer.parseInt(data); //예외 발생 => 숫자변경 불가
//			System.out.println(data.toString()); // 예외 발생=> null 포인터 예외
//			System.out.println("반가워요!!");
//	
//		}catch(NumberFormatException | NullPointerException e) {
//			System.out.println("예외가 발생했습니다.!");
//		}
		
		// -모든 상황에 대비한 예외 처리 코드를 만들수 없다!!
		// - 예외 클래스들의 부모 클래스를 이용한 한꺼번에 처리
		
		try {
			String data = "ㅋㅋㅋ";
			int value = Integer.parseInt(data); //예외 발생 => 숫자변경 불가
			System.out.println(data.toString()); // 예외 발생=> null 포인터 예외
			System.out.println("반가워요!!");
	
		}catch(NumberFormatException e) {
			System.out.println("숫자로 바꿀수 없는 문자열입니다!");
		}catch(Exception e) {
			System.out.println("예외가 발생했습니다.!");
		}finally { //  어떤 예외가 발생하더라도 실행되는 영역
			 System.out.println("무조건 실행");
		}
		
		
		

	}

}













