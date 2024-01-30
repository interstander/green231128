package chapter18;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Main06 {

	public static void main(String[] args) throws Exception {
		// 이미지 읽어오기
		
		File file = new File("C:\\Users\\GREEN\\Downloads\\woman.jpg");
		
		FileInputStream fis = new FileInputStream(file);
		// 파일을 읽어올 빨대
		
		int readCheckData; 
		byte[] imgData = new byte[100];
		
		while((readCheckData=fis.read(imgData))!=-1) {
			String data = new String(imgData);
			System.out.print(data);
		}
		fis.close();
		
		
		

	}

}
