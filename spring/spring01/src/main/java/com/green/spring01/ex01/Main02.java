package com.green.spring01.ex01;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class Main02 {

	public static void main(String[] args) {
		// 스프링이 관리하는 객체를 가져와서 사용
		
		AbstractApplicationContext ctx
			= new AnnotationConfigApplicationContext(JavaConfig.class);
		// 스프링 컨테이너가 동작되면서 설정파일에 작성된 빈(bean) 객체를 생성한다.
		
		Greeter greeter = ctx.getBean("greeter",Greeter.class);
		// 컨테이너에 있는 빈을 읽어온다.
		
		String message = greeter.greet("고길동");

		System.out.println(message);
		
		ctx.close();
		// Ioc 제어의 역전
		//   - 객체를 스프링이 생성하고 관리한다.(개발자가 객체를 생성하지 않는다)
	}

}
