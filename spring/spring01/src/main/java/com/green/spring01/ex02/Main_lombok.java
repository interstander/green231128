package com.green.spring01.ex02;

public class Main_lombok {

	public static void main(String[] args) {
//		MemberVO member =  new MemberVO();
//		member.setId(10);
		// lombok을 통해서 생성자, get/set 메서드를 사용할수 있다.
		
		//  코드상으로 get/set, 생성자의 존재를 만들지만
		//   IDE는 get/set, 생성자의 존재를 모른다.
		
		// 해결벌 : IDE에게 lombok을 인식 시켜주어야 한다.
		//   => 혹시 에러가 난다면 프로젝트에서 우클릭 -> Maven -> updateProject
		MemberVO member = new MemberVO();
		member.setEmail("aa@naver.com");
		

	}

}
