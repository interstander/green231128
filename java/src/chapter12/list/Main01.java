package chapter12.list;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class Main01 {

	public static void main(String[] args) {
		// 리스트 사용법 예제
		List<String> names = new ArrayList<>();
		// String 객체를 저장할 ArrayList를 선언   =>  크기가 없다.
		
		//데이터 저장하기 : add(객체); 
		names.add("하츄핑");  // 0 
		names.add("샤샤핑");  // 1
		names.add("포실핑");  // 2
		names.add("말랑핑");  // 3

		// 리스트의 크기 : size();   // 배열의 length
		System.out.println("리스트의 길이 : "+names.size());  // 4개
		
		//  데이터 조회하기 : get(인덱스번호);
		String name2 = names.get(2);
		System.out.println("2번 인덱스의 이름 : "+name2);  // 포실핑
		
		// 데이터 끼워 넣기 : add(인덱스번호,객체); 
		names.add(2, "새콤핑"); 
		System.out.println("리스트의 길이 : "+names.size());  // 5개
		name2 = names.get(2);
		System.out.println("2번 인덱스의 이름 : "+name2);  // 새콤핑
		System.out.println("3번 인덱스의 이름 : "+names.get(3));  // 포실핑
		
		// 데이터 변경하기 : set(인덱스번호,객체);
		names.set(2, "달콤핑");
		System.out.println("리스트의 길이 : "+names.size());  // 5개
		name2 = names.get(2);    // names[2];
		System.out.println("2번 인덱스의 이름 : "+name2);  // 달콤핑
		
		// 데이터를 삭제하기 : remove(인덱스번호);
		names.remove(2);
		System.out.println("리스트의 길이 : "+names.size());  // 4개
		name2 = names.get(2);
		System.out.println("2번 인덱스의 이름 : "+name2);  // 포실핑
		
		// 리스트가 비었는가?  : isEmpty();
		names.isEmpty();
		
		// 리스트 내용을 모두 삭제 : clear(); 
		// 데이터 삭제를 객체정보르 지우기 : remove(객체);
		// 리스트에 해당 객체가 있는 지 판단 contains(객체)
		
		//  리스트의 전체 데이터 조회하기
		//  1. 일반 반복문
		System.out.println("1. 단순 반복문을 이용해서 데이터 출력");
		for(int i=0;i<names.size();i++) {
			System.out.println((i+1)+"번째 티니핑 : "+names.get(i));
		}
		
		//  2. 향상된 for문 : 모든 데이터 조회, 인덱스가 중요하지 않을때
		System.out.println("2. 향상된 for문을 이용해서 데이터 출력");
		for(String name : names) {
			System.out.println("티니핑 : "+name);
		}
		
		//  3. 반복자를 활용한 방법  => 리스트에서는 거의 안쓴다.
		System.out.println("3. 반복자를 이용해서 데이터 출력");
		
		Iterator<String> itr = names.iterator();
		
		while(itr.hasNext()) {
			// 다음 나올 사람(객체)이 있는가? 
			String name = itr.next();  // 너 나와~~
			System.out.println("티니핑 : "+name);
		}
		
		// while(itr.hasNext()){...}  => 다시 반복문 돌리기 X
	//	itr.next();  --> 에러
		
		// 반복자(Iterator)를 다시 사용하고 싶다면 names.iterator();재호출
		
		
		
		
		
		
		
		
		
		
		

	}

}
