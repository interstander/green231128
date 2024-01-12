package chapter08.com.green.main;

import chapter08.com.green.vo.TestM;

public class Main03 {

	public static void main(String[] args) {
		TestM m1 = new TestM();  // 다른 패키지
		
		System.out.println("다른 패키지 클래스의 public 필드 : "+m1.field1);
		System.out.println("다른 패키지 클래스의 default 필드 : "+m1.field2);
		System.out.println("다른 패키지 클래스의 private 필드 : "+m1.field3);
		
		m1.method1();
		m1.method2();
		m1.method3();
		//  =>  public은 어디서나 사용 가능
		
		TestM2 m2 = new TestM2(); // 같은 패키지
		
		System.out.println("같은 패키지 클래스의 public 필드 : "+m2.field1);
		System.out.println("같은 패키지 클래스의 default 필드 : "+m2.field2);
		System.out.println("같은 패키지 클래스의 private 필드 : "+m2.field3);
		
		m2.method1();
		m2.method2();
		m2.method3();
		//  =>  default는 같은 패키지면 사용 가능
		
		
		
	}

}
