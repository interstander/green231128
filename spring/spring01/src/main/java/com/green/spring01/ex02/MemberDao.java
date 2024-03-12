package com.green.spring01.ex02;

import java.util.HashMap;
import java.util.Map;

public class MemberDao {
	private static long nextId = 0;
	
	private Map<String,MemberVO> map = new HashMap<>();
	
	public void insert(MemberVO member) {
		member.setId(++nextId);
		map.put(member.getEmail(), member);
	}
	
	public MemberVO selectByEmail(String email) {
		return map.get(email);
	}
	
}
