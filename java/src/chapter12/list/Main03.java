package chapter12.list;

import java.util.ArrayList;
import java.util.List;

public class Main03 {

	public static void main(String[] args) {
//		List<int> numbers = new ArrayList<>();
		List<Integer> numbers = new ArrayList<>();

		// 제네릭으로 기본타입을 매개값으로 전달 받을수 없다.
		//  기본타입의 데이터를 인스턴스로 포장하는 클래스가 존재
		//                    => Wrapper 클래스

		int num = 100;  //기본 타입
		Integer number = new Integer(num); //기본타입을 Wrapper클래스로 감싸는 것
				//				boxing 
		
		number = Integer.valueOf(num);
			//		boxing : 기본타입 데이터를 Wrapper 클래스로 포장
		
		int num2 = number.intValue(); 
		    //   Wrapper클래스의 데이터를 기본 타입 데이터로 꺼내는 것 :  unboxing
		
		int num3 = Integer.parseInt("100");
		double num4 = Double.parseDouble("3.14");
		
		// Wrapper클래스의 종류
		//   byte    => Byte
		//   short   => Short
		//   int     => Integer
		//   long    => Long
		//   float   => Float
		//   double  => Double
		//   boolean => Boolean
		//   char    => Character
		
		// JDK1.8이후로는 자동 박싱 언박싱이 지원된다.
		
		Integer a = 100;  // 자동 박싱
		int b = 200;
		
		int result = a+b;
		     //    a객체가 자동 언박싱이 진행되서 기본타입 연산이 진행
		System.out.println("결과 : "+result);
		
		
		
		
		
		
	}

}
