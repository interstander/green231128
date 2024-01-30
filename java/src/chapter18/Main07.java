package chapter18;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class Main07 {

	public static void main(String[] args) throws Exception {
		// 이미지 출력
		File file = new File("Z:\\sample\\data.jpg");

		FileOutputStream fos = new FileOutputStream(file);
		
		// 빈 배열로 이미지 채우기
		for(int i=0;i<100;i++) {
			byte[] imgData = new byte[100];
			fos.write(imgData);
		}
		
		fos.flush();
		fos.close();
		System.out.println("이미지 작성 완료");
		
		
		
	}

}
