package chapter12.sample;

public class Coffee implements Comparable<Coffee>{
	private String name;
	private int price;
	
	public Coffee(String name, int price) {
		this.name = name;
		this.price = price;
	}
	// 커피객체를 정렬=> 가격순 
	@Override
	public int compareTo(Coffee o) {
		//비교 기준 : 오름차순
		//  - 내가 더 크다 : 양수
		//  - 내가 더 작다 : 음수
		//  - 같다 : 0
		if(this.price > o.getPrice()) {
			return -1000;
		}else if(this.price < o.getPrice()) {
			return 100;
		}else {
			return 0;
		}
		
		
		// 문자열 기준 정렬
//		return this.name.compareTo(o.getName());
		
		
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	
	
}
