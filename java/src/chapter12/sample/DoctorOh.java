package chapter12.sample;

import java.util.Comparator;

public class DoctorOh implements Comparator<PokeMon>{
	// 임의의 클래스에 비교 기준을 정해주는 클래스
	@Override
	public int compare(PokeMon o1, PokeMon o2) {
		// 오름차순 정렬 기준
		// o1 > o2 : 양수
		// o1 < o2 : 음수
		// o1 = o2 : 0
		if(o1.getLevel() > o2.getLevel()) {
			return 1;
		}else if(o1.getLevel() < o2.getLevel()){
			return -1;
		}else {
			return 0;
		}
	}
	

}
