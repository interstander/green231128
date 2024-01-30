package chapter18;

import java.io.IOException;
import java.io.OutputStream;

public class Main03 {

	public static void main(String[] args) throws Exception {
		// 콘솔  출력 방법 - 기본

		OutputStream os = System.out;
		
//		기본 1글자 출력
//		int a = 65;
//		os.write(a);
//		os.flush();
//		os.close();
		
		String name = "홍길동";
		// 문자열을 출력하고 싶다면 바이트 배열로 변환
		byte[] nameBytes = name.getBytes(); 
		
		os.write(nameBytes);
		os.flush();
		os.close();
		
//  	콘솔 입출력을 도와주는 도구
//		- 입력을 도와주는 도구 : Scanner
//		- 출력을 도와주는 도구 : PrintStream (보조스트림) 
		
		
		
	}

}
