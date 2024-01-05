package chapter02;

public class Variable03 {

	public static void main(String[] args) {
		// 형변환 ()

		// 변수 안의 데이터를 다른 변수에 옮겨 담기
		int a1 = 10;
		int a2 = a1;
		
		//  타입(형)이 다른 경우의 데이터 옮겨 담기
		//    => 기본은 안된다!!
		
		//  [예외] 기본타입에서는 옮겨 담는 것이 일부 가능
		// 변수의 크기
		//  byte < short < int < long < float < double
		
		//    묵시적 형변환(자동형변환)
		short b1 = 100;
		float b2 = b1;
		
	
		//    명시적 형변환(강제형변환)
		float c1 = 200.0f;
		short c2 = (short)c1;
		
		byte c3 = (byte)c1;
		System.out.println("변형된 데이터 : "+c3);
		
		// 문자 자동 형변환
		char c4 = '큭';   // char : 2바이트
//		short c5 = c4;     // short : 2바이트 => 숫자의 범위(음수)가 다르므로 크기가 같아도 자동형변환 안됨
		
		int c6 = c4;      
		
		
		
		
		
		
		
		
		
		
	}

}
