package com.green.spring01.ex02;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class Main03 {

	public static void main(String[] args) {
		// 실제 스프링에서 동작하는 의존 주입 방법
		
		String email = "hong@naver.com";
		String password = "1234";
		String name = "홍길동";
		
		AbstractApplicationContext ctx
		= new AnnotationConfigApplicationContext(JavaConfig.class);
		// 컨테이너가 빈 객체를 생성할 때 필요한 의존 객체를 주입을 해준다.

		MemberRegisterService memberRegSvc = ctx.getBean("memberRegSvc",MemberRegisterService.class);
		memberRegSvc.regist(email, password, name);
		
	}

}
