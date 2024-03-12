package com.green.spring01.ex02;

public class Main02 {

	public static void main(String[] args) {
		// Assembler 객체를 통해서 의존 주입 받은 MemberRegisterService 사용예
		
		Assembler assembler = new Assembler();
		
		String email = "hong@naver.com";
		String password = "1234";
		String name = "홍길동";
		
		
		//  외부 객체를 통해서 의존을 해결한 방법 (의존 주입)
		MemberRegisterService memberRegSvc = assembler.getMemberRegSvc();
		memberRegSvc.regist(email, password, name);

	}

}
