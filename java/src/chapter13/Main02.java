package chapter13;

import java.util.Scanner;

public class Main02 {
	
	public static void main(String[] args) throws Exception{
		// 예외 간접 처리 => 떠넘기기
		try {
			method1();
		}catch(Exception err) {
			System.out.println("예외 발생");
			// err 변수에는 예외 인스턴스가 저장
			System.out.println("예외 메시지 : "+err.getMessage());
			err.printStackTrace();  // 예외가 어디서 발생했는지 추적
			
		}
//		method1();

	}

	private static void method1() throws Exception{
			method2();
		
		
	}

	private static void method2() throws ArithmeticException, NullPointerException{
		//예외 발생
		System.out.println("5/0 : "+(5/0));

	}

}





