package com.green.spring01.ex01;

import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.support.AbstractApplicationContext;

public class Main03 {

	public static void main(String[] args) {
		AbstractApplicationContext ctx
		= new AnnotationConfigApplicationContext(JavaConfig.class);
		
		Greeter greeter1 = new Greeter();
		Greeter greeter2 = new Greeter();	
		
		Greeter greeter3 = ctx.getBean("greeter",Greeter.class);
		Greeter greeter4 = ctx.getBean("greeter",Greeter.class);

		// 스프링이 관리하는 객체는 싱글턴 형태로 1개만 생성해서 관리한다.
		
		System.out.println("(greeter1==greeter2) =>"+(greeter1==greeter2));
		System.out.println("(greeter3==greeter4) =>"+(greeter3==greeter4));
		
		
	}

}
