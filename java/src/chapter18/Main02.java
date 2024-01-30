package chapter18;

import java.io.IOException;
import java.io.InputStream;

public class Main02 {

	public static void main(String[] args) throws Exception {
		// 콘솔 입력 방법 - 기본
		
//		// 1. 스트림 객체가 필요
//		InputStream is = System.in;
//		
//		// 2. 입력 메서드 호출
//		//int asciiCode = is.read();
//		 char asciiLetter = (char)is.read();
//		
//		// 3. 입력된 데이터 확인
//		//System.out.println("입력된 데이터 확인 : "+asciiCode);
//		 System.out.println("입력된 글자 확인 : "+asciiLetter);
		
//		is.close();
		 
		System.out.println("------------------------------------------");
		// 한글의 경우에는 1바이트로 처리불가 => 최소 2바이트 이상
		InputStream is = System.in;
		byte[] byteData = new byte[5];
		
		int readByteNum = is.read(byteData);
		
		String str = new String(byteData); // 문자배열을 문자열로 변환
		
		System.out.println("입력된 글자 확인 : "+str);
		
		is.close();
		
		
		
		
		
	}

}
