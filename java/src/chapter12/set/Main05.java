package chapter12.set;

import java.util.TreeSet;

import chapter12.sample.DoctorOh;
import chapter12.sample.PokeMon;

public class Main05 {

	public static void main(String[] args) {
		// 임의의 객체 정렬하기2=> 제3의 클래스에게 비교를 맡기는 방법
		//       Comparator 인터페이스를 구현해서
		//       compare메서드를 오버라이드해서 생성

		TreeSet<PokeMon> tree = new TreeSet<>(new DoctorOh());
		
		tree.add(new PokeMon("야도란",14));
		tree.add(new PokeMon("잠만보",21));
		tree.add(new PokeMon("파이리",17));
		tree.add(new PokeMon("피카츄",29));
		tree.add(new PokeMon("파오리",11));
		tree.add(new PokeMon("꼬부기",25));
		
		System.out.println("레벨순 정렬");
		
		for(PokeMon p:tree) {
			System.out.println("레벨 : "+p.getLevel()+" /이름 : "+p.getName());
		}
		
		
		
		
		
	}

}
