package com.green.spring01.ex01;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class JavaConfig {
	//  수동으로 스프링이 관리하는 객체를 만들어주는 객체
	
	//  스프링이 관리하는 객체 : 빈(컴포넌트)
	
	@Bean
	public Greeter greeter() {
		Greeter gt = new Greeter();
		gt.setFormat("%s님 환영합니다.");
		return gt;
	}

}
