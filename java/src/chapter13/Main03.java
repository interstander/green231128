package chapter13;

import java.util.Scanner;

public class Main03 {
	static Scanner scan = new Scanner(System.in);

	public static void main(String[] args) {
		// 사용자 정의 예외를 발생시키는 방법
		System.out.println("코로나 검사 ");
		try {
			method1();
		} catch (MyException e) {
			e.printStackTrace();
			System.out.println("예외 발생 사유 : "+e.getMessage());
		}
	}

	private static void method1() throws MyException{
		System.out.println("체온을 입력하세요");
		int temp = Integer.parseInt(scan.nextLine());
		method2(temp);
		
	}

	private static void method2(int temp) throws MyException{
		if(temp >= 39) {
			throw new MyException("코로나 감염 의심 환자입니다.");
			// 사용자 정의 예외 발생 : throw
			// 해당 조건의 경우 예외를 발생 시키세요!!
		}
		
	}
	

}
