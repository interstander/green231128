package chapter16;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;
import java.util.stream.Stream;

public class Main02 {

	public static void main(String[] args) {
		// 스트림 : 다수의 데이터를 효율적으로 처리하기 위한 도구
		
		// 2단계 중간처리 (필터, 매핑)
		
		// 1)필터의 역할 => 걸러주는 것
		//     => 매개값으로 조건을 만들수 있는 기능 (T/F)
		
		int[] scores1 = new int[] {45,78,65,59,83};
		IntStream stm1 = Arrays.stream(scores1);
		
//		stm1.filter(어떤 조건의 데이터를 통과시킬 것인가?);
			
		 // 람다식을 이용한 방법
//		stm1.filter((s)->{return s>=60;});
		
		// 익명 객체를 이용한 방법
//		stm1.filter(new IntPredicate() {  
//			
//			@Override
//			public boolean test(int value) {
//				boolean result = value>=60;
//				return result;
//			}
//		});
		
		// 실제 클래스를 이용한 방법
//		stm1.filter(new HapgyokScore());   
		
	//  (78,65,83)만 걸러져서 통과 된다.
		
//-------------------------------------------------------------------------------
		// 2) 매핑 => 각 요소데이터를 다른 타입의 데이터로 변경
		int[] scores2 = new int[] {45,78,65,59,83};
		IntStream stm2 = Arrays.stream(scores2);
		stm2.mapToObj((s)->{return (s>=60)?"합격":"불합격";});
		//   {"불합격","합격","합격","불합격","합격"}
		
//--------------------------------------------------------------------------------
		// 중간 처리는 필터와 매핑을 섞어서 사용이 가능하다.
		List<Game> lists = new ArrayList<>();
		lists.add(new Game("C&C","RTS",17000));
		lists.add(new Game("PERSONA 5","RPG", 69800));
		lists.add(new Game("LOL","AOS",0));
		lists.add(new Game("Warcraft 3","RTS",36000));
		lists.add(new Game("The Witcher 3","RPG", 34800));

		
//		Stream<Game> stmA = lists.stream();
//		
//		Stream<Game> stmB = stmA.filter((g)->{return g.getType().equals("RTS");});
//		//  {Game("C&C"..), Game("Warcraft 3"...)}
//		
//		IntStream stmC = stmB.mapToInt((g)->{return g.getPrice();});
//		//   {17000, 36000}
		
		
		lists.stream()
			 .filter((g)->{return g.getType().equals("RTS");})
			 .mapToInt((g)->{return g.getPrice();});
		
		//  매핑 메서드 종류
		//  객체 -> 객체 : map()
		//  기본타입 -> 객체 : mapToObj()
		//  객체 -> 기본타입 : mapTo기본타입();
		
		
		
		
		
		
		
	}

}
