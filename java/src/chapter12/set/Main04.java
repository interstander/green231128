package chapter12.set;

import java.util.TreeSet;

import chapter12.sample.Coffee;

public class Main04 {

	public static void main(String[] args) {
		// 임의의 객체 정렬하기1=> 내가 비교
		//       Comparable인터페이스를 구현해서
		//       compareTo메서드를 오버라이드해서 생성
		TreeSet<Coffee> menus = new TreeSet<>();
		
		menus.add(new Coffee("카라멜 프라푸치노",5300));
		menus.add(new Coffee("카페라떼",4100));
		menus.add(new Coffee("카페 아메리카노",3600));
		menus.add(new Coffee("에스프레소 칩",5400));
		menus.add(new Coffee("바닐라 라떼",4600));

		for(Coffee c: menus) {
			System.out.println("이름 : "+c.getName()+", 가격 : "+c.getPrice());
		}
		
	}

}
