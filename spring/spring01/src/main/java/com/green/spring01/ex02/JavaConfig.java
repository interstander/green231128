package com.green.spring01.ex02;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JavaConfig {
	// 스프링 컨테이너를 통한 범용적인 조립방법

	@Bean
	public MemberDao dao() {
		return new MemberDao();
	}

	@Bean
	public MemberRegisterService memberRegSvc() {
		return new MemberRegisterService(dao());  //  의존적인 빈을 주입해준다.
	}
}
