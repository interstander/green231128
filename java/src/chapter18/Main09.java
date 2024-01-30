package chapter18;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class Main09 {

	public static void main(String[] args) throws Exception {
		// 성능향상 보조스트림 => 이미지 복사
		
		// 버퍼스트림을 사용하지 않았을 때 
		long start = 0;
		long end = 0;
		
		File originImg = new File("C:\\Users\\GREEN\\Downloads\\woman.jpg");
		File copyImg1 = new File("Z:\\sample\\woman1.jpg");
		
		FileInputStream fis1 = new FileInputStream(originImg);
		FileOutputStream fos1 = new FileOutputStream(copyImg1);
		
		byte[] imgData = new byte[1];
		int readCheck;
		
		start = System.nanoTime();
		while((readCheck=fis1.read(imgData))!=-1) {
			fos1.write(imgData);
		}
		fos1.flush();
		end = System.nanoTime();
		
		System.out.println("Buffered가 없을때 : "+(end - start)+"ns");
		
		fos1.close();
		fis1.close();
		
//---------------------------------------------------------------------------------------
		File copyImg2 = new File("Z:\\sample\\woman2.jpg");
		
		FileInputStream fis2 = new FileInputStream(originImg);
		FileOutputStream fos2 = new FileOutputStream(copyImg2);
		
		BufferedInputStream bis = new BufferedInputStream(fis2);
		BufferedOutputStream bos = new BufferedOutputStream(fos2);
		
		start = System.nanoTime();
		while((readCheck=bis.read(imgData))!=-1) {
			bos.write(imgData);
		}
		bos.flush();
		fos2.flush();
		end = System.nanoTime();
		
		System.out.println("Buffered가 있을때 : "+(end - start)+"ns");
		
		bos.close();
		fos2.close();
		bis.close();
		fis2.close();
		
		
		
		
		

	}

}
