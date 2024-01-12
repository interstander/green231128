package chapter08.com.green.vo;

public class TestM {
	// 접근제어자(public, default, private)가 달린 멤버
	public String field1 = "public";
	String field2 = "default";
	private String field3 = "private";
	
	public void method1() {
		System.out.println("public");
	}
	void method2() {
		System.out.println("default");
	}
	private void method3() {
		System.out.println("private");
	}
	
	public void check() {
		System.out.println("클래스 내부의 public 필드 : "+this.field1);
		System.out.println("클래스 내부의 default 필드 : "+this.field2);
		System.out.println("클래스 내부의 private 필드 : "+this.field3);
		
		this.method1();
		this.method2();
		this.method3();
		
		// => private은 클래스(인스턴스) 내부에서만 사용 가능
	}
	
}
