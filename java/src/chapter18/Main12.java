package chapter18;

import java.io.File;
import java.io.FileInputStream;
import java.io.ObjectInputStream;

public class Main12 {

	public static void main(String[] args) throws Exception {
		// 인스턴스 조회
		String targetFileName = "Z:\\sample\\Object.x";
		File targetFile = new File(targetFileName);
		FileInputStream fis = new FileInputStream(targetFile);
		ObjectInputStream ois = new ObjectInputStream(fis);
		
		ClassA b = (ClassA)ois.readObject();
		
		System.out.println("field1 : "+b.field1);
		System.out.println("field2.field10 : "+b.field2.field10);
		System.out.println("field3 : "+b.field3);
		System.out.println("field4 : "+b.field4);
		
		ois.close();
		fis.close();
	}

}
