package chapter12.set;

import java.util.Iterator;
import java.util.Set;
import java.util.TreeSet;

public class Main02 {

	public static void main(String[] args) {
		//  트리셋(집합) 사용법 예제
		//   +정렬
		
	//	Set<String> names = new TreeSet<>();
		TreeSet<String> names = new TreeSet<>();
		//  크기를 위한 메서드를 사용할 수 있다
		
		names.add("송길동");
		names.add("박길동");
		names.add("이길동");
		names.add("고길동");
		names.add("복길동");
		names.add("홍길동");
		names.add("최길동");
//    고, 박, 복, 송, 이, 최, 홍
		
		System.out.println("첫번째 이름 : "+names.first());
		System.out.println("마지막 이름 : "+names.last());
		System.out.println("송길동보다 바로 아래 있는 이름 : "+names.lower("송길동"));// 복길동
		System.out.println("신길동보다 바로 위 있는 이름 : "+names.higher("신길동"));//이길동
		System.out.println("복길동이거나 바로 아래 있는 이름 : "+names.floor("복길동"));// 복길동
		System.out.println("장길동이거나 바로 위 있는 이름 : "+names.ceiling("장길동"));// 최길동
		
		// 전체 데이터 조회시 => 사실상 크기 순으로 출력
		System.out.println("전체 데이터 조회");
		Iterator<String> itr = names.iterator();
		
		while(itr.hasNext()) {
			System.out.println("이름 : "+itr.next());
		}
		
		// 데이터 출력후 삭제
		System.out.println("데이터 출력후 삭제");
		for(int i=0;i<7;i++ ) {
			System.out.println("이름 : "+names.pollFirst());
		}
		
		System.out.println("크기 : "+names.size());
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
