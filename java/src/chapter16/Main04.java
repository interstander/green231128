package chapter16;

import java.util.Arrays;
import java.util.List;

public class Main04 {

	public static void main(String[] args) {
		// 스트림 : 다수의 데이터를 효율적으로 처리하기 위한 도구
		
		// 최종 처리 : reduce() : 여러 데이터를 줄여주는 도구
		//  reduce(?1,?2)
		
		// ?1 : 스트림 데이터가 없는 경우 반환할 데이터 
		// ?2 : reduce를 진행할 람다식(Operator)

	//  예시 :  마블 히어로중에 이름이 가장 긴 히어로 를 출력하세요.
		
		List<String> names = Arrays.asList(
									"Hulk",
									"DeadPool",
									"AntMan",
									"IronMan",
									"CaptainAmerica",
									"SpiderMan",
									"Thor");
		
		String name = names.stream()
						   .reduce("",(n1,n2)->{
							   return (n1.length()>n2.length()?n1:n2);
							   });
		
		System.out.println("이름이 가장 긴 히어로 : "+name);
		
		
		
		
		
		
		
		
		
		
		
	}

}
