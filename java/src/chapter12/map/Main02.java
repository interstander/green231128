package chapter12.map;

import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;

public class Main02 {

	public static void main(String[] args) {
		// TreeMap : 키를 기준으로 정렬되서 저장
		//    => 정렬을 확인 가능하는 메서드가 추가
		
		TreeMap<String,Integer> datas = new TreeMap<>();
		
		datas.put("박길동", 78);
		datas.put("고길동", 57);
		datas.put("홍길동", 81);
		datas.put("송길동", 66);
		datas.put("이길동", 91);
		datas.put("최길동", 57);
		datas.put("마길동", 87);
	//  고 마 박 송 이 최 홍
		
		System.out.println("첫번째 사람 : "   //고길동
				+datas.firstEntry().getKey()+
				", 점수 : "+datas.firstEntry().getValue());
		System.out.println("마지막 사람 : "   //홍길동
				+datas.lastEntry().getKey()+
				", 점수 : "+datas.lastEntry().getValue());
		
		System.out.println("신길동이전 사람 : "   //송길동
				+datas.lowerEntry("신길동").getKey()+
				", 점수 : "+datas.lowerEntry("신길동").getValue());
		
		System.out.println("신길동이후 사람 : "   //이길동
				+datas.higherEntry("신길동").getKey()+
				", 점수 : "+datas.higherEntry("신길동").getValue());
		
		System.out.println("최길동보다 아래거나 같은 사람 : "   //최길동
				+datas.floorEntry("최길동").getKey()+
				", 점수 : "+datas.floorEntry("최길동").getValue());
		
		System.out.println("배길동보다 위거나 같은 사람 : "   //송길동
				+datas.ceilingEntry("배길동").getKey()+
				", 점수 : "+datas.ceilingEntry("배길동").getValue());
		
		// 전체 데이터 조회시 이름순으로 정렬되어서 출력
//		for(Map.Entry<String, Integer> data:datas) {}
		//  맵은 forEach문 사용불가
		
		Set<String> keySet = datas.keySet();
		
		Iterator<String> keyItr= keySet.iterator();
		
		while(keyItr.hasNext()) {
			String key = keyItr.next();
			int value = datas.get(key);
			
			System.out.println("이름 : "+key+", 점수 : "+value);
		}
		
		
		
		
		
	}

}
