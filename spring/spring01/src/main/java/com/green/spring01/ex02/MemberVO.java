package com.green.spring01.ex02;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
//@Getter
//@Setter
@Data
public class MemberVO {
	//  lombok 라이브러리
	//   데이터 저장용 객체를 편리하게 사용할 수 있도록 도와주는 도구
	//    - @NoArgsConstructor : 빈 생성자를 만들어주는 어노테이션
	//    - @AllArgsConstructor : 모든 필드를 매개값으로 받아주는 생성자를 만들어주는 어노테이션
	//    - @Getter : 자동으로 getter메서드를 만들어준다.
	//    - @Setter : 자동으로 setter메서드를 만들어준다.
	//    - @Data : 자동으로 Get/Set 메서드를 만들어준다.
	
	private Long id;
	private String email;
	private String password;
	private String name;
	private Date registerDate;
	
	public MemberVO(String email, String password, String name, Date registerDate) {
		this.email = email;
		this.password = password;
		this.name = name;
		this.registerDate = registerDate;
	}

	
}
