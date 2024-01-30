package chapter18;

import java.io.File;
import java.io.FileOutputStream;
import java.io.ObjectOutputStream;

public class Main11 {

	public static void main(String[] args) throws Exception {
		// 인스턴스 데이터를 파일로 저장
		String targetFileName = "Z:\\sample\\Object.x";
		File targetFile = new File(targetFileName);

		// 인스턴스 기록
		FileOutputStream fos = new FileOutputStream(targetFile);
		ObjectOutputStream oos = new ObjectOutputStream(fos);
		
		ClassA a = new ClassA();
		a.field1 = 10;
		a.field2.field10 = 20;
		a.field3 = 30;
		a.field4 = 40;
		
		oos.writeObject(a);
		oos.flush();
		oos.close();
		fos.close();
		
		System.out.println("객체 기록 완료");
		
//---------------------------------------------------------------------
		

		
		
		
		
		
	}

}
