package chapter12.etc;

import java.util.Stack;

public class Main01 {

	public static void main(String[] args) {
		// 스택 => LIFO
		Stack<String> names = new Stack<>(); 
		// 계산기 : 계산식을 전부 작성후 한꺼번에 계산
		
		//  데이터 저장 : push(객체);
		//  데이터 읽기 : pop();  => 조회후 삭제
		//  데이터 읽기 : peek();  => 조회후 미삭제
		//  크기 조회 : size();
		//  전체 데이터 삭제 : clear()
		//  비어있는 가 확인 : isEmpty();
		
		names.push("박길동");
		System.out.println("가장 위에 있는 이름 : "+names.peek());
		names.push("이길동");
		System.out.println("가장 위에 있는 이름 : "+names.peek());
		names.push("김길동");
		System.out.println("가장 위에 있는 이름 : "+names.peek());
		names.push("장길동");
		System.out.println("가장 위에 있는 이름 : "+names.peek());
		names.push("최길동");
		System.out.println("가장 위에 있는 이름 : "+names.peek());
		
		System.out.println();
		while(!names.isEmpty()) {
			System.out.println("이름 : "+names.pop());
		}
		
		
		
		
		
		

	}

}
