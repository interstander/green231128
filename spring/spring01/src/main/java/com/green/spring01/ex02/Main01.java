package com.green.spring01.ex02;

public class Main01 {

	public static void main(String[] args) {
		// 스프링 없이 동작 예제
		String email = "hong@naver.com";
		String password = "1234";
		String name = "홍길동";
		
		MemberRegisterService memberRegSvc = new MemberRegisterService();
		memberRegSvc.regist(email, password, name); //회원 가입 기능
		
		//  회원 가입 서비스의 가입기능은 Dao객체에 의존적이다.!!
		
		//  의존하는 객체를 구하는 방법
		//    1. 직접 객체를 생성하는 방법 => 유지보수에 문제점
		//     스프링은 Ioc을 사용하므로 직접 객체 생성을 하지 않는다.
		
		//    2. 외부에서 객체를 만들어 넣어주는 방법
		//      => Java 객체를 이용해서 조립한다.
		
		
		
	}

}
