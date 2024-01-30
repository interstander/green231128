package chapter18;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class Main08 {

	public static void main(String[] args) throws Exception {
		// 이미지 읽어와서 기록하기 => 복사
		File originFile = new File("C:\\Users\\GREEN\\Downloads\\woman.jpg");
		File copyFile = new File("Z:\\sample\\data.jpg");
	
		FileInputStream fis = new FileInputStream(originFile);
		FileOutputStream fos = new FileOutputStream(copyFile);
		
		int readCheckNum;
		byte[] readData = new byte[100];
		
		while((readCheckNum=fis.read(readData))!=-1) {
			fos.write(readData);  
		}
		
		fos.flush();
		fos.close();
		fis.close();
		
		System.out.println("복사가 잘되었습니다.");
		
		
		
	
	
	}

}
