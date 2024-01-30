package chapter18;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

public class Main04 {

	public static void main(String[] args) throws Exception {
		// 텍스트 파일을 읽기위한 스트림 : Reader
		
		File file = new File("Z:\\sample\\BoardController.java");
		//						파일이 실제있냐 없냐는 중요하지 않음 -> 예외발생

		FileReader fr = new FileReader(file);
		
//		// 1. 텍스트 문서파일을 1바이트씩 한땀한땀 읽어서 변환
//		int readData;
//		while((readData = fr.read()) != -1) {
//			char data = (char)readData;
//			System.out.print(data);
//		}
//		fr.close();
//		
		
//		2. 텍스트 문서파일을 100글자씩 읽어서 변환
		int readData;					// 수레안에 담기 데이터의 량
		char[] chData = new char[100];  // 배열 => 실제 데이터가 담긴 수레
		while((readData=fr.read(chData)) != -1) {
			String data = new String(chData);
			System.out.println(data);
		}
		fr.close();
		
		
		
		
		
		
	}

}




