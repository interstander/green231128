package chapter12.etc;

import java.util.LinkedList;
import java.util.Queue;

public class Main02 {

	public static void main(String[] args) {
		// 큐 : FIFO : 인터페이스
		//    구현한 클래스 LinkedList<>
		
		Queue<String> names = new LinkedList<>();

		// 데이터 저장 : offer(객체);
		// 데이터 조회 : poll();   => 조회후 삭제
		// 데이터 조회 : peek();   => 조회후 미삭제
		//  크기 조회 : size();
		//  전체 데이터 삭제 : clear()
		//  비어있는 가 확인 : isEmpty();
		
		
		names.offer("박길동");
		System.out.println("가장 먼저 나올 이름 : "+names.peek());
		names.offer("이길동");
		System.out.println("가장 먼저 나올 이름 : "+names.peek());
		names.offer("김길동");
		System.out.println("가장 먼저 나올 이름 : "+names.peek());
		names.offer("최길동");
		System.out.println("가장 먼저 나올 이름 : "+names.peek());
		names.offer("장길동");
		System.out.println("가장 먼저 나올 이름 : "+names.peek());
		
		System.out.println();
		while(!names.isEmpty()) {
			System.out.println("이름 : "+names.poll());
		}
		
		
		
		
	}

}
