package chapter08.com.green.main;

public class TestM2 {
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
}
