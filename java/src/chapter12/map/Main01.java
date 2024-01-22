package chapter12.map;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class Main01 {

	public static void main(String[] args) {
		// Map(HashMap의 기본 사용법)
		
		Map<String,Integer> scores = new HashMap<>();
		//   키객체   값객체
		//   중복X
		
		scores.put("고길동", 80);
		scores.put("송길동", 78);
		scores.put("백길동", 69);
		scores.put("최길동", 91);
		scores.put("양길동", 78);
		
		System.out.println("맵의 크기 : "+scores.size());
		scores.put("홍길동", 91);
		System.out.println("맵의 크기 : "+scores.size());
		
		
		System.out.println("기존 백길동 성적 : "+scores.get("백길동"));
		scores.put("백길동", 79);
		System.out.println("변경후 백길동 성적 : "+scores.get("백길동"));
		System.out.println("맵의 크기 : "+scores.size());
		
		scores.remove("최길동");
		System.out.println("맵의 크기 : "+scores.size());
		
//---------------------------------------------------------------------
	//  전체 데이터 조회
	//  Iteratable를 구현하고 있지 않으므로 반복자을 이용할 수는 없다.
	//    =>  반복자를 이용하려면 Set으로 변경후 반복자 이용
		
	//  1) Entry를 Set으로 변경후 반복자 호출하는 방법
		System.out.println("1) Entry를 Set으로 변경후 전체 데이터 조회");
		Set<Map.Entry<String,Integer>> entrySet = scores.entrySet();
		  //  맵에 저장되는 엔트리 타입
		
		Iterator<Map.Entry<String,Integer>> entryItr= entrySet.iterator();
		
		while(entryItr.hasNext()) {
			Map.Entry<String,Integer> entry = entryItr.next();
			
			String key = entry.getKey();
			int value = entry.getValue();
			
			System.out.println("이름 : "+key+", 점수 : "+value);
			
		}
	
	//  2)  key를 Set으로 변경후 반복자 호출하는 방법
		System.out.println("2) key를 Set으로 변경후 전체 데이터 조회");
		Set<String> keySet = scores.keySet();
		
		Iterator<String> keyItr= keySet.iterator();
		
		while(keyItr.hasNext()) {
			String key = keyItr.next();
			int value = scores.get(key);
			
			System.out.println("이름 : "+key+", 점수 : "+value);
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		

	}

}
