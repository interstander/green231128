package com.green.spring01.ex02;

import java.util.Date;

import lombok.NoArgsConstructor;

@NoArgsConstructor
public class MemberRegisterService { // 회원 가입 기능
	
	private MemberDao memberDao; //= new MemberDao();
	
	// => MemberRegisterService가 생성될 때 외부에서 만들어진 Dao객체를 전달 받는다.
	public MemberRegisterService(MemberDao memberDao) {
		this.memberDao = memberDao;
	}
	
	// MemberRegisterService객체는 MemberDao에 의존적이다!
	public void regist(String email, String password, String name) {
		// 이메일이 중복인지 확인
		MemberVO member = memberDao.selectByEmail(email);
	
		if(member != null) {
			// 이메일 중복 => 가입 금지
			throw new AlreadyExistingMemberException("이메일 중복");
		}
		
		MemberVO newMember = 
				new MemberVO(email,password,name,new Date());
		
		memberDao.insert(newMember);
		
		System.out.println("가입 완료");
	}

}
