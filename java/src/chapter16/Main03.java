package chapter16;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.IntStream;

public class Main03 {

	public static void main(String[] args) {
		// 스트림 : 다수의 데이터를 효율적으로 처리하기 위한 도구
		
		// 3단계 최종처리 =>모든 처리를 마무리하고 우리가 원하는 데이터의 형태로 출력하기 위한 도구
		//   sum(), count(), average(), min(), max()
		//   reduce(), forEach()
		
		int[] scores1 = new int[] {45,78,65,59,83};
//		IntStream stm1 = Arrays.stream(scores1);
//		
//		IntStream stm2 = stm1.filter((s)->{return s>=60;});
//		//{78,65,83}
//		int sum = stm2.sum();
		
		int sum = Arrays.stream(scores1)
						.filter((s)->{return s>=60;})
						.sum();
		
		int sum2 = 0;
		for(int i=0;i<scores1.length;i++) {
			if(scores1[i] >= 60) {
				sum2+=scores1[i];
			}
		}
		
		//   등록된 게임의 RPG 장르게임의 가격 합산
		List<Game> lists = new ArrayList<>();
		lists.add(new Game("C&C","RTS",17000));
		lists.add(new Game("PERSONA 5","RPG", 69800));
		lists.add(new Game("LOL","AOS",0));
		lists.add(new Game("Warcraft 3","RTS",36000));
		lists.add(new Game("The Witcher 3","RPG", 34800));
		
		int sum3 = lists.stream()
						.filter((g)->{return g.getType().equals("RPG");})
						.mapToInt((g)->{return g.getPrice();})
						.sum();
		System.out.println("등록된 RPG게임의 가격 합계 :"+sum3);
		
		
		// RTS 게임 목록을 출력하세요.
		List<String> rtsGame = new ArrayList<>();
		lists.stream()
			 .filter((g)->{return g.getType().equals("RTS");})
			 .forEach((g)->{rtsGame.add(g.getName());});
		
		
		
		
		
		
		
		
	}

}
