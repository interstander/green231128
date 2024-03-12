package com.green.spring01.ex01;

public class Main01 {

	public static void main(String[] args) {
		// Greeter 클래스의 greet 메서드를 사용하고자 한다.
		
		// 기존 자바 코드를 통해서 객체를 생성하고 메서드 실행
		Greeter gt = new Greeter();
		gt.setFormat("%s님 안녕하세요!");
		
		String message = gt.greet("홍길동");
		
		System.out.println(message);

	}

}
