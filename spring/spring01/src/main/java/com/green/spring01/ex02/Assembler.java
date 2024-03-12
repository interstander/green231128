package com.green.spring01.ex02;

public class Assembler {
	// 자바 객체를 생성해서 조립해주는 기능 => 스프링 동작 방식
	
	private MemberDao memberDao;
	private MemberRegisterService memberRegSvc;
	
	public Assembler() {
		this.memberDao = new MemberDao();
		this.memberRegSvc = new MemberRegisterService(this.memberDao);
	}
	
	public MemberRegisterService getMemberRegSvc() {
		return memberRegSvc;
	}
	
}
