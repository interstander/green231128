package chapter07;

public class StaticAndInstance {
	// 정적멤버와 인스턴스 멤버간 상호 교류
	
	// 정적멤버
	static int sfield1;
	static void sMethod() {
		System.out.println("정적 메서드");
	}
	
	// 인스턴스 멤버
	int iField2;
	void iMethod() {
		System.out.println("인스턴스 메서드");
	}
	
//----------------------------------------------------------
	// 위 멤버를 사용하기 위한 정적 메서드
	 public static void method1() {
		 sfield1 = 10;
//		 iField2 = 20;  // 정적멤버는 인스턴스가 만들어지기 전부터 사용 가능
		 sMethod();
//		 iMethod();
	 }
	// 위 멤버를 사용하기 위한 인스턴스 메서드
	public void method2() {
		 sfield1 = 10;
		 iField2 = 20;
		 sMethod();
		 iMethod();
	}
	
	
	
	
	
	
	
	
	

}
