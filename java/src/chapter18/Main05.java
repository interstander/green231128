package chapter18;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class Main05 {

	public static void main(String[] args) throws Exception {
		// 텍스트 파일을  출력을 위한 스트림 : Writer
		
		File file = new File("Z:\\sample\\test.txt");
		
		FileWriter fw = new FileWriter(file,false);
							// 	옵션 : true  -> 같은 파일이 있는 경우 내용추가
							//        false -> 덮어쓰기(기본값) 
		fw.write("안녕하세요\n");
		fw.write("반갑습니다\n");
		fw.write("잘가세요\n");

		fw.flush();
		fw.close();
		System.out.println("저장 완료");
	}

}
