package chapter15;

public class Main03 {

	public static void main(String[] args) {
		// 람다식의 종류 => 메서드의 종류
		//  1) 매개값 X 반환타입 X : Ex01Interface
		//  2) 매개값 O 반환타입 X : Ex02Interface
		//  3) 매개값 X 반환타입 O : Ex03Interface
		//  4) 매개값 O 반환타입 O : Ex04Interface
		
		System.out.println(" 1번 예시");
		Ex01Interface ei1;
		ei1 = ()->{
			String str = "람다식 메서드 호출";
			System.out.println(str);
		};
		ei1.method();
		// 실행문이 한줄인 경우 {}를 생략
		ei1 = ()->System.out.println("실행문이 한줄인 경우");
		ei1.method();
		
		System.out.println(" 2번 예시");
		Ex02Interface ei2;
		ei2 = (int a)->{System.out.println(a*5);};
		ei2.method(5);
		ei2 = (a)->{System.out.println(a*5);};  // 매개변수 타입 생략 가능
		// 매개변수가 1개인 경우 ()로 생략이 가능하다 
		//     매개변수가 없거나, 2개이상인 경우는 ()를 생략하면 안됨
		ei2 = a->System.out.println(a*5); 
		ei2.method(5);
		
		System.out.println(" 3번 예시");
		Ex03Interface ei3;
		ei3 = ()-> {
			int result  = 10;
			return result;
		};
		System.out.println(ei3.method());
		ei3 = ()-> {return 10;};
		// 한줄의 실행문이 return인 경우 {}와 return 동시에 생략할수 있다
//		ei3 = ()-> return 10;
		ei3 = ()-> 10;
		System.out.println(ei3.method());
		
		System.out.println(" 4번 예시");
		Ex04Interface ei4;
		ei4 = (a,b)->{   // 매개변수 이름은 임의로 지정해서 사용 가능
			int result = a*b;
			return result;
		};
		System.out.println(ei4.method(3,4));
		ei4 = (a,b)->{return sum(a,b);};  //   <= 람다식의 몸체에서 다른 메서드를 그대로 사용하는 케이스를 '메서드 참조'
		
		
		
//		method(public static method(???) {
			
//		});
		
		
	}
	public static int sum(int q,int w) {
		return q+w;
	}
	
//	public static method(???) {
//		
//	}
}














