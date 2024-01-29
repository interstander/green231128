package chapter16;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.stream.DoubleStream;
import java.util.stream.IntStream;
import java.util.stream.LongStream;
import java.util.stream.Stream;

public class Main01 {

	public static void main(String[] args) {
		// 스트림 : 다수의 데이터를 효율적으로 처리하기 위한 도구
		
		// 1. 다수의 데이터(=> 배열, 컬렉션)를 스트림으로 변환(1차 파이프에 담기)
		//     기본타입의 데이터를 변환하는 스트림 : 타입명Stream 객체
		//     참조타입의 데이터를 변환하는 스트림 : Stream<T> 
		
		String[] names = new String[] {"박길동","고길동","홍길동","이길동"};
		Stream<String> stm = Arrays.stream(names);
	
		int[] scores = new int[] {89,75,80,74};
		IntStream stm2 = Arrays.stream(scores);
		DoubleStream stm3;
		LongStream stm4;
		
		//  리스트, 셋 (맵 X) => stream으로 변환하기 위한 메서드를 가진다.  => Collection인터페이스 정의
		List<String> lists = new ArrayList<>();
		lists.add("박길동");
		lists.add("고길동");
		lists.add("홍길동");
		lists.add("이길동");
		
		Stream<String> stm5 = lists.stream();
		
		Set<String> sets = new HashSet<>();
		Stream<String> stm6 = sets.stream();
		
		
		
		
		
		
		
		
		
		
		
		
		
		

		
	}

}
