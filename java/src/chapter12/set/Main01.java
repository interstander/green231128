package chapter12.set;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

public class Main01 {

	public static void main(String[] args) {
		// 셋(집합) 사용법 예제
		Set<String> names = new HashSet<>();
		
		// 데이터 저장하기 : add(객체);
		names.add("체리");
		names.add("베리");
		names.add("레몬");
		names.add("용과");
		
		
		// 데이터 조회하기 : X   => 반복자를 통한 전체 데이터만 조회
		
		// 셋의 크기 조회 : size();
		System.out.println("집합의 크기 : "+names.size());
		
		// 중복된 데이터를 저장했을때 => 저장하지 않는다.
		names.add("레몬");
		names.add("용과");
		
		System.out.println("집합의 크기 : "+names.size());
		
		//  데이터 삭제하기 : remove(객체); 
		names.remove("레몬");
		
		System.out.println("집합의 크기 : "+names.size());
		
		// 전체 데이터 지우기 : clear();
		// 데이터가 존재하는지 판단 :isEmpty();
		//  데이터 있는지 판단 contain();
		System.out.println("용과가 있는지 : "+names.contains("용과"));
		
		// 전체 데이터 조회
		// 1. 향상된 for문은 이용 가능
		System.out.println("1. 향상된 for문으로 전체 데이터 조회");
		for(String name : names) {
			System.out.println("이름 : "+name);
		}
		// 2. 반복자를 이용한 방식
		System.out.println("2. 반복자를 이용한 전체 데이터 조회");
		Iterator<String> itr = names.iterator();
		
		while(itr.hasNext()) {
			System.out.println("이름 : "+itr.next());
		}
		
		
		
		
		
		
	}

}
